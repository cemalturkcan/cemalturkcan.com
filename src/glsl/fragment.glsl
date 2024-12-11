uniform vec3      iResolution;
uniform float     iTime;
uniform float     iTimeDelta;
uniform float     iFrameRate;
uniform int       iFrame;
uniform float     iChannelTime[4];
uniform vec3      iChannelResolution[4];
uniform vec4      iMouse;
uniform sampler2D iChannel0;
uniform vec4      iDate;
uniform float     iSampleRate;

#define NUM_LAYERS 4.

mat2 Rot(float a) {
    float s = sin(a);
    float c = cos(a);
    return mat2(c, -s, s, c);
}

float Star(vec2 uv, float flare) {
    float d = length(uv);
    float m = .1/d;

    // Original ray calculations preserved exactly
    float rays = max(0., 1.-abs(uv.x*uv.y*500.));
    m += rays*flare;

    rays = max(0., 1.-abs(uv.x*uv.y*1000.));
    m += rays*.3*flare;

    m *= smoothstep(1.,.2,d);
    return m;
}

float Hash21(vec2 p) {
    p = fract(p*vec2(424.34,342.21));
    p += dot(p, p+34.32);
    return fract(p.x*p.y);
}

vec3 StarLayer(vec2 uv) {
    vec3 col = vec3(0);
    uv *= .04;
    vec2 gv = fract(uv)-.5;
    vec2 id = floor(uv);

    for(int y=-1; y<=1; y++) {
        for(int x=-1; x<=1; x++) {
            vec2 offs = vec2(x,y);
            float n = Hash21(id+offs);
            float size = fract(n*345.32);

            vec2 star_pos = gv-offs-vec2(n,fract(n*34.))+.5;
            float star = Star(star_pos, smoothstep(.85,1.,size));

            vec3 color = vec3(0.49,0.808,0.878)*smoothstep(0.8,1.0,size);

            // Original animation preserved
            star *= sin(iTime*2.0+n*3.1415)*0.3+0.7;

            col += star*size*color;
        }
    }
    return col;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = (fragCoord-.5*iResolution.xy)/iResolution.y;
    vec2 M = (iMouse.xy-iResolution.xy*.5)/iResolution.y;
    float t = iTime*.02;

    uv += -M*3.;
    uv *= 2.;

    // Single rotation calculation
    mat2 rot = Rot(t+length(uv));
    uv *= rot;

    vec3 col = vec3(0);

    for(float i=0.; i<1.; i+=1./NUM_LAYERS) {
        float depth = fract(i+t);
        float scale = mix(20.,.5,depth);
        float fade = depth*smoothstep(1.,.9,depth);
        col += StarLayer(uv*scale+i*454.23-M*3.)*fade;
    }

    fragColor = vec4(col,1.0);
    fragColor.a = .3;
}

void main() {
    mainImage(gl_FragColor, gl_FragCoord.xy);
}
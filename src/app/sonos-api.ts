export interface SonosApiConfig {
    server: string;
    port: string;
    https: boolean;
    rooms: string[];
    tts?: {
        enabled?: boolean;
        language?: string;
        volume?: string;
    };
}

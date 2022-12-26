/** @type {import('ts-jest/dist/types').InitialOptionsTsJest} */
module.exports = {
    clearMocks: true,
    coverageProvider: "v8",
    coverageReporters: ["text", "lcov"],
    coverageDirectory: "coverage",
    collectCoverageFrom: ["src/**/*"],
    coveragePathIgnorePatterns: ["node_modules", "src/"],
    testPathIgnorePatterns: ["node_modules", "dist"],
    transformIgnorePatterns: ["node_modules"],
    watchPathIgnorePatterns: ["node_modules"],
    testEnvironment: "node",
    transform: {
        "^.+\\.(t|j)sx?$": ["@swc/jest"],
    },
};

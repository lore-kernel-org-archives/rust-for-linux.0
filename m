Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022137.outbound.protection.outlook.com [52.101.101.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9812426CE2F;
	Wed, 28 Jan 2026 14:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769610754; cv=fail; b=JGUbAdoMCh7ByMaN7f8vPk/TglEGDvOZoo9/vctUuiuKaXb47z0oFw2M04I1TT25S2Ixz2+xHxsNfSy/UpWTejZEKfuwlZj64yL+xAUz+++MwJnoIW++W6tXKS4TlxLA4/qxYSW0CqHrLcs7rqHqBgcVBLfsVBqbyMAriIiTVb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769610754; c=relaxed/simple;
	bh=GC2BYJo3h9PsE5WMcVTa24KRCLg7nlqnoIHl8+o4YCs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=LCWraKqW3dWR3gm4ykJhefuLYiLsUf7Vnri5AWKWr9wpnKLsvQ1kDo0AeqH2KzK2RDRIGRmcUGnCzlGQipg80Y40h196+pmaVWkJNUk6FR9vQrObvtupSuE6porq0H5DCUZYJbbfr2jPH946yKah8w0r4icMGyK5SSJSMR8nZ1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=xPFbaRYx; arc=fail smtp.client-ip=52.101.101.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="xPFbaRYx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UwkHGryiEE7dupT0384CJAAEl2ajddmjFFVWzeiis3aBiTVf6R5parE5C8J90HZNFZX2lUEpAiFDy462zAPGZholPSp8lY6BImCeL8oSwHb4P2RvQN11B7T0fOEfYB068VIIxINyhove/xVQ5pw/oocOYYPKGcfcKJIQAC0aEM2/ZMU92DMU7dl8sojk3OvWJTOTxTmBXzmhsWPh6gXQKeweHbSlginrByvYbWJJ8GQ4UzrW0A7QfUyYvlxiutl80dSuvTlulVw72hRKdMMx7IfIm9NHxpEGzRR8lnQrjcUFSXBpBVZ+2oZapbNaUaRWHIPINboeN9nlkdu/7VFTuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UR+G0SPEDLOFB4kj4IVxLYj5GbL2d/wS+cn2VF1e0ZQ=;
 b=QVDqEnd2Cz+mFID6ZG8YBhJoWposOIxo4sJWVbsYi6dyheIYALZQQzccVi4ggVcfQFcYOy1UQNelj1St7HTA8OOhZ59bV8Cm0I8SRq6++SpbyUDyJ6cLPaNF91EkydUHpydJP+hxF3RHHVzuaanwnmQ78ZbCoIIT2C9x1205M0/pPK4cl+/jG61sWh4SInGnTKsc5BkNTpk+G59ILnu4GLNkpvaDaCUnX+O/GsnGSBrUsD1dhQy6+DiAZXX+SiWDP730FWXa+xEtcEePvwfSRS8QGoQTsUTIu9ebMLYlhv4HTnPGByXOCjtgzw4Sy4R/LJxXyOCGIDVVsPuCsojVZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UR+G0SPEDLOFB4kj4IVxLYj5GbL2d/wS+cn2VF1e0ZQ=;
 b=xPFbaRYxDbg1OYhDtNv4+FpvqtFr5A+WnYxpbGdTX7iIjj/WX0Vga8ptG4DseEeeS7YYaYeu6PrbySNgx0LstnzCMMUZBj9PkcFh6xNagZ67upadt+w0cAW5aZy1cQueVkoh92Et4dfAwfzB2e2aWZA0N+DEFmolC2PqTEfvmAs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB7285.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:308::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 14:32:29 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 14:32:27 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 14:32:27 +0000
Message-Id: <DG0ANMHJMJ40.3J7GZJ5H6WRMA@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: add `CacheAligned` for easy cache line alignment
 of values
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260128-cache-aligned-v1-1-a4eb7c3ffd35@kernel.org>
In-Reply-To: <20260128-cache-aligned-v1-1-a4eb7c3ffd35@kernel.org>
X-ClientProxiedBy: LO4P123CA0116.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: c9b01d4b-926b-4bce-7bf7-08de5e7a0fcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bUNRekpvNGNEOGdGZCtjTDJrYWxzTXRPVjJNVnl3anFBY255N21Kb0dJMkwr?=
 =?utf-8?B?T3h4YnNqalFKam0xL1dUQjBUY3hzeHRxaUpBVFByOEI2Zk9YcjJYRElZcDUy?=
 =?utf-8?B?RWpZVTZJbVQ1L1dLY1p4N1hCT2QxWWtiaEUxQjlibmtzRmo5a3J3czUwdG53?=
 =?utf-8?B?SktiR2wzY2RjUEcvVTg5ZXNSSnNGWWpaeTlzVzV4czFZZHppc1djWWdVK0k4?=
 =?utf-8?B?QVdtRktReXZCaWs4NllzOGhZTThWamt5SkhOYS9pLy9kUllSSFZybWlJaTRw?=
 =?utf-8?B?V3BhS2RCcVNaWDVoYk5lcUMydzEwMk5sWmNUeVlFS0tBM1ZDOGNjY3U3a2Jw?=
 =?utf-8?B?MytVUzBDeHlaOHJMUm5pZ3B2OExDVHdkdXEvV0I4bGRIQ0FUc2hPREN6eTIz?=
 =?utf-8?B?TUMyempkNmxZejQ2OEpVQnoxKzBDSzhpZGlNTVFENnNnUmxhRnJLS1VFSzBJ?=
 =?utf-8?B?OFlBTWhvVndFVzY4bW5kem9HSW1qZUlqejJMM3I4M2wxb3JVbXF5WVVOaVdF?=
 =?utf-8?B?a3AyU0RqeUsxTy9CdG5tU0pFRDJUUzQvVlFFSElxSGlDeW81OHN4ZjYzQ2Ji?=
 =?utf-8?B?MmZ3dXdQQWxGQ2MyS3lPR2Z3bUhKSlpObnhBcUk2VnBPaWF3a0pacGFmbFZN?=
 =?utf-8?B?SGhIelVZYjBtM3BYM1J3b3RKMzJXMGtlZVpVZ0JLV3NON2w5WE9CMlF0eFNv?=
 =?utf-8?B?ZEp4UUdHRjM1OGdETWNSUHJxY0Y0RWlVRkhEbjFmcE5COHFBZThHRTNkb3dW?=
 =?utf-8?B?UEZ4cjZzZlBQcFJENGpRT0tpeEtra1pXUGNKWFYvdXBLNXR4NjNhRVNwUTBD?=
 =?utf-8?B?S01XdjVrN1hMR09lZ1U5bGQyU1RhaEk0akxlUDRlZXVIUWw0M3BoZDYwanpN?=
 =?utf-8?B?S0cvZWlydVVGYlo3UWlTMW54bFJ4MTU4c1JJQThZYzlKREhEUitpWnl3cVNF?=
 =?utf-8?B?TmxlYVZZNnJIWnJUKzNSbEgzaDJmTm8zVndZMno0VENNMG1KV0xGNEJaVVps?=
 =?utf-8?B?Vmdvbmc1RENqY3kvazJNamFYRGZraE1vRlFGWUtxQTVnVTVPaGxza013WmFx?=
 =?utf-8?B?c2V6S1IwZ0pCSERCM3BCbmwxU1pvdzQ0aEFMdThOUFVsQVpnZ1RpMW5CSFlQ?=
 =?utf-8?B?eTA1Wm95TSsxWjBXVk5zYkFXWDdIcmsxQitZQXpLZUhKblFJeEh4eGcwaEpN?=
 =?utf-8?B?Nk5TS0hMNG11MzZ2ajQ1QkswbmFyVU04U0Z5czZLVkVBbkl2SDFnSFR6KzVr?=
 =?utf-8?B?QTBiZjVsQzg0Y0tCUFlqdzlRL2E0YWcrQWlBUzB1OWhDekp2cmlhUmZ6by9k?=
 =?utf-8?B?MHVyd0RsRnlUQVlDWG1PM0orem5MNWxBNjY2WHRiUUozN1FrZXBJQ1RsVU1v?=
 =?utf-8?B?OGFFeG1CMDFjUTBMVy9kOFphLzVaM0p6UmhpWHNhd1JCQ0xsQk5TN0pYZk9m?=
 =?utf-8?B?ZFJwbGE1TUtja0JraVZJVEtVV25PeDhDajdHNUtudDhsV3hLd3ZFUy9tY2tj?=
 =?utf-8?B?LzRjaEVYZy9YMlI3eXpyc3ZkWEZ0cU9pVmpSVzViMzQreTAvZjhKMHZmTGNS?=
 =?utf-8?B?NFFBZmdxY2l5ZW0yWTcvUEZPbmx1TXpQMnNxUnZXbDhnZlhYaHJMcXA1Njk5?=
 =?utf-8?B?R2xQcHZuQ2w1QmNRVU90ejAxOHcrZVc0NlAxdUtmZUVtMkorMFp3WE5yN21G?=
 =?utf-8?B?YjBEWEVWZlZnMXRIbS9yaytxVkdYbWpPdnFwQk5Vbzc2dTNNL3FmL0ZIeWdu?=
 =?utf-8?B?NDhqVjdpdE1aL3Q4dzQrMENpQlN3ZmN1Qk10OFZSUTR0S1BJYUJqQXA1RlpY?=
 =?utf-8?B?UWFkK2Z5TkcyNWhPbWpiS0xVekdSOGEwTjdwemtFbFJGSllqajZQVG54cUpq?=
 =?utf-8?B?aDVpVWdYaTYxdjdReElVUHp3WG5rRXorWWxVU1ZQQkNtVGdJYWxVQzgvU1hu?=
 =?utf-8?B?aDBqbGZ0S2IrMmNQQzQ4aE1GalFPYWFDYytFUmpPYkp0VldrVkNYY1BSaitj?=
 =?utf-8?B?RG4vNG42RVU4VXZRbThYVTI5SmFjK0MybDhDY1h6ZHBaWGNvZGFKUXdIN0lj?=
 =?utf-8?B?WVM2V1dUZlB0ZmFUMUlsOWh5OTNLb2VTeUtTTkZTVmRobm15cDRmajBka1Rw?=
 =?utf-8?Q?SKvU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlJmV2tPUFhVUXZlN0dwRUUxQTZWMEpDNXJKTjBFUlR2N1lLaU5rMGtDWUo1?=
 =?utf-8?B?QUJNNlB3dk5qbGxXNkpkejNCUE1rT21wQnU0Y05NQWI3bG0wL0Y4R3FRQmJj?=
 =?utf-8?B?MGplbWdtV2tRS2o1ZG55anNCTDNHbm5JYVFGTHU1QUIycUx6NzZQcmVBdUlq?=
 =?utf-8?B?emhOTGJrV0wzUW9RWkhjSUhxNmJBT1pFOWtLVldxVUtvbnlSK2g4UklRUElx?=
 =?utf-8?B?UlRXZWNMQWNNa0JKemZYVGtTQmI4KzRtZzl6UGlqbndIWUxMMWVpVVludUYr?=
 =?utf-8?B?bm96cDlNcUpUaldxaEgrMTk4TEZZWVl0cGhSc0tDRW5IdU5HTDdtNDhrWHYr?=
 =?utf-8?B?anQ4T25LY0k1YmkxTmkrK2l6bVJyK0lZcGZ6TXg0Y04zdy9VdlA3TThYWllN?=
 =?utf-8?B?Z1h2c1k3Z0dzc3pHejcrV0dtNmR5K3B3d0h5b3VoL3BFbVV2cVVDdnVSQUZG?=
 =?utf-8?B?MkYrc2x5U1d1WnZCaStaR0VCNFp2OXEvZmtoblV4bEE0R0RidG85Tk5wN0NS?=
 =?utf-8?B?akF5RFRXVklFaEJKZDM0Ull0RkllSDVUYmhrOGc3N0dITVVJN0x4Q3VMcFd3?=
 =?utf-8?B?UGNKTXlSZ0tQako5ajN4MnA2ZTBtbU1wYzJocTE3MFpHUkF6SndwUEdhRjJn?=
 =?utf-8?B?T1dLNW9kODRGY2FwNmVRc05YcUlqbzZaTEJhTTdKYWhkem5mKytyMzFIc1dV?=
 =?utf-8?B?ZktCZTFwd3l3ck44R1pRT2JEb0ljVmdWWWkrc0xkSmJCZzZYLzFzYTZJaVJZ?=
 =?utf-8?B?NHVoRmdkZ3lrUHNIekRGeWw4ZGtJTmd3K0owaFF0YjhLVW50VVJVcklUZWlk?=
 =?utf-8?B?a1FFcjdNUXZlclBoaW5xNlM5TkdmOUF1ZkJWbi8rUlVHSVIvWHViNzMvWk1j?=
 =?utf-8?B?OFp1TFM1MWJLRkVjdzNBMjFIRmxhYWRzczlGNWYrVTlLN2VkSVRNT1VRMlNM?=
 =?utf-8?B?N1p0NTVsdHJrZkVtQUp2bG5mbFlyU2Z2YVkyYXZtUk1lOFpvSll1dWU2QlFx?=
 =?utf-8?B?VnJTZHcyamJYZThYUndESXZoOHVNV1BsY3dQcmowL2l3ZitqNUExNXdCK2NK?=
 =?utf-8?B?OHJlYitlRUNycGRwRFhRNlBiNTU0bVBlZ0JiWDNCWGZFTmNLcVVYOU51Y1dy?=
 =?utf-8?B?ZUxiekFvWDZnOGhQaDM3L3V1dnFuZndGQndlQzhYNVpOL2diZmlPZnJnQ0hW?=
 =?utf-8?B?ZUdhYTVNZ09YR1hWSEg3ZFlvbHBoVGh2V2lQbGJLSFNRcGZwdXNZQmRNclox?=
 =?utf-8?B?R1RTTUhVTmZrZnRxSGpIRVpLY1JaLzZpTTJvbnN3WlN5dWovcGR4TVBEWE9H?=
 =?utf-8?B?Y2dvYmV3RmNaSEdkcWcrcE12eS9zRFBHajZjRkgwTWZHQjBiSkhBOXBDZms0?=
 =?utf-8?B?aFpDVGwxbXo1dnFkTzdua3labkVtaGVhbTdabVNzbEJ0Y0FkRDZHejllWkNV?=
 =?utf-8?B?VERCZHVSb1VRK1JEZ3hHL0haaWU0dEJYakMwZWhxK1BHTjBucnpzbG0ya2xN?=
 =?utf-8?B?WkpKZXpFZUpPL2pGZWpNTy8vZGFLcmZIblRpRFpXcWpndTFSYWhjZUR6S2Zi?=
 =?utf-8?B?WnByRGljNGxjWFpjNDNCanN5SGxvYjVVK1NpOE9VeDBpRXk3V3VMS3RDbi94?=
 =?utf-8?B?WTVraHVkblVZc1hGYTF5UjJWak9LTWpRMkx3andqSm1sZklWTGxjK3ZoSjZv?=
 =?utf-8?B?SGRndzJ5NjVtNzZubzBWU3VtWkM5c1QrcU1Ibm9iM0NNcXZwbEdyYmtWWVJi?=
 =?utf-8?B?VWY5M0I3VGlrYi84bkc1RmRuRHRVUDdsQWMzdUpOb05GMVc4ckQvR1JSalhp?=
 =?utf-8?B?ejlHNThwOG9JTkNsTG82NzJaWUpYd3FYSmlNb1J6Rnc5MDRxNGFsN2JBWDZJ?=
 =?utf-8?B?OFdhWHVobExYUGJLMk4wN1VpdDRBazNmWHpJd2YzQVhZSlRFQ0Jtc0Uwd29q?=
 =?utf-8?B?SjdIcnh2Rk11M1VhQ1lWaGYzUC9nU2NSY0ZmK0FWbjBKRFVLQzF0c0tqM1pj?=
 =?utf-8?B?SkFXRURKaGV5bmdKRFhOMWJpTkgzTTRsLzdhRWlPMEwrU1FnK1NkMUJjdWFw?=
 =?utf-8?B?OElkd1FmVk1hUXR1UjJ4aUZqUTRtZ2g4b2lIL2QreVNIQXJlSWJadjMxZjhl?=
 =?utf-8?B?Y21PeEdqVTcrL3laSkx4YmtCb3RMRW5VVFd4Ykh6V2dERUQyU0k4VS9kV2Fs?=
 =?utf-8?B?dW4yV24vVi90TjUrejBkT1NWOUlDaDJJVFZ5U1VMUEpNRFNTSWU1ellGQnVz?=
 =?utf-8?B?UlFWY1ZXbE1yZkQ2eDFUaGtWcWhFbWpvSWpsOW5hMTRVWGRXWDlTNkQvZE1n?=
 =?utf-8?B?OWQ5Z044V1c5cURkbzFzdG5sSnVYalhDTTUzN3dMT1h2YjRCbGt5QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b01d4b-926b-4bce-7bf7-08de5e7a0fcd
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 14:32:27.8144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CUf2PgAgpAz0jq9EWAQnEFF6qJG7A2WX4/vmkbdrwpoMTHxSBpW4aed1IngMSD7aiV2QIZ8Z9GGJPeVa606C4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB7285

On Wed Jan 28, 2026 at 2:05 PM GMT, Andreas Hindborg wrote:
> `CacheAligned` allows to easily align values to a 64 byte boundary.
>
> An example use case is the kernel `struct spinlock`. This struct is 4 byt=
es
> on x86 when lockdep is not enabled. The structure is not padded to fit a
> cache line. The effect of this for `SpinLock` is that the lock variable a=
nd
> the value protected by the lock might share a cache line, depending on th=
e
> alignment requirements of the protected value. Wrapping the value in
> `CacheAligned` to get a `SpinLock<CacheAligned<T>>` solves this problem.

Do you mean `CacheAligned<SpinLock<T>>`?

>
> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
> ---
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Double SOB

> ---
>  rust/kernel/cache_aligned.rs | 59 ++++++++++++++++++++++++++++++++++++++=
++++++
>  rust/kernel/lib.rs           |  2 ++
>  2 files changed, 61 insertions(+)
>
> diff --git a/rust/kernel/cache_aligned.rs b/rust/kernel/cache_aligned.rs
> new file mode 100644
> index 0000000000000..9c33b8613c077
> --- /dev/null
> +++ b/rust/kernel/cache_aligned.rs
> @@ -0,0 +1,59 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use kernel::try_pin_init;
> +use pin_init::{
> +    pin_data,
> +    pin_init,
> +    PinInit, //
> +};
> +
> +/// Wrapper type that alings content to a 64 byte cache line.
> +#[repr(align(64))]
> +#[pin_data]
> +pub struct CacheAligned<T: ?Sized> {
> +    #[pin]
> +    value: T,
> +}
> +
> +impl<T> CacheAligned<T> {
> +    /// Creates an initializer for `CacheAligned<T>` form an initalizer =
for `T`
> +    pub fn new(t: impl PinInit<T>) -> impl PinInit<CacheAligned<T>> {
> +        pin_init!( CacheAligned {
> +            value <- t
> +        })
> +    }
> +
> +    /// Creates a fallible initializer for `CacheAligned<T>` form a fall=
ible
> +    /// initalizer for `T`
> +    pub fn try_new(
> +        t: impl PinInit<T, crate::error::Error>,
> +    ) -> impl PinInit<CacheAligned<T>, crate::error::Error> {
> +        try_pin_init!( CacheAligned {
> +            value <- t
> +        }? crate::error::Error )
> +    }

You don't need two methods. You can have a single `new` method that's gener=
ic
over error type.

> +
> +    /// Get a pointer to the contained value without creating a referenc=
e.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `ptr` must be dereferenceable.
> +    pub const unsafe fn raw_get(ptr: *mut Self) -> *mut T {
> +        // SAFETY: by function safety requirements `ptr` is valid for re=
ad
> +        unsafe { &raw mut ((*ptr).value) }
> +    }

Have you had a case where you need this? Most wrapper types shouldn't need =
this.

> +}
> +
> +impl<T: ?Sized> core::ops::Deref for CacheAligned<T> {
> +    type Target =3D T;
> +
> +    fn deref(&self) -> &T {
> +        &self.value
> +    }
> +}
> +
> +impl<T: ?Sized> core::ops::DerefMut for CacheAligned<T> {
> +    fn deref_mut(&mut self) -> &mut T {
> +        &mut self.value
> +    }
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index f812cf1200428..af6d48b078428 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -75,6 +75,7 @@
>  pub mod bug;
>  #[doc(hidden)]
>  pub mod build_assert;
> +mod cache_aligned;
>  pub mod clk;
>  #[cfg(CONFIG_CONFIGFS_FS)]
>  pub mod configfs;
> @@ -156,6 +157,7 @@
> =20
>  #[doc(hidden)]
>  pub use bindings;
> +pub use cache_aligned::CacheAligned;

Let's not expose this from top-level of kernel crate.

I have been thinking about a good namespace for these auxillary types. For =
my
own project I would chuck them to `crate::utils`, but that won't be a very
descriptive name.

I wonder for this and other types that tweak the memory layout, we could ha=
ve a
`kernel::layout` which contains utilities for precisely controlling the lay=
out?

Best,
Gary

>  pub use macros;
>  pub use uapi;
> =20
>
> ---
> base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
> change-id: 20260128-cache-aligned-c4c0acf870ff
>
> Best regards,


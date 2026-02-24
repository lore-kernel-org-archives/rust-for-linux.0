Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012069.outbound.protection.outlook.com [40.107.209.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AE111CBA;
	Tue, 24 Feb 2026 14:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771942935; cv=fail; b=EQc3PNkcrspiGtDKhQMFa/pIktHXd4pHPZ6Ok9hBHEf6anTBZhI8eMA7mxLk+G/YOBAklAL0t4J1ex8QBAQeEbloA9YmE6m9w8s7NtNZeaio9aTWbydo3YLQPhpmPvgpK4caq6n6XipWTcM6+50DfRF0UXr6UHY1k///Wbq3fMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771942935; c=relaxed/simple;
	bh=1kv5aSawX+oCP+4yMD1xVnWWaFH9oyFLqiG5aiKxF3Q=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Kgst+3FWwMUzreTBGZtXPOS0aaU1sVTX/HMUDWXA52IlfVgD7Hb3ybdituUie1i4iBRbjS7Qj587BgAV6VooFEfULxqb0Ahhx09U3/gZnO1fLGGv68FwPv/EzG0ujsJBfa4fintliRwzJV7xTHuDg1MZugkEcEFDDRhFP8ke1A8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XfbjfEBC; arc=fail smtp.client-ip=40.107.209.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XfbjfEBC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wGptGjTbfD3uDSPaXA8ri1sisk3WlB0PC+61KC3cHFOYW1udjC4cW2SMYHoTEdVw+cRiLOa02ySBC0/LCOA1Uuqfo8sDgSwpXwt2gFEju+ykIaQkO7V+fMSSRmcOjyvRv2wgzVOz5Ei+EIdRyI10HYnunt6EJkJgJYSfm04jcsSM3ZsenlingNuDnbf0tY65hxAH70KXNXX0JaNRIXdH3byxf0J+C6ZQRbvR5FDHF9lVmf77+dvHE48qu6XGYC9K2fnW8X022cvtAu2db38eKTOTByxioUEa6npREv6nj1LNjqUbZk1Fn6DCuV5F6NzAJhWOBheBezhm6j4UIjgJTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FONw0WfVzKsaMV8vVv++1EfIgc+QJ/oi73x2zo/SyRM=;
 b=wTC3UdjrswA2HAc7qqC+V5gGF12f3r04j+p8R1Ha9hsZqClm3lNMcYjNoVS27Pp8ukHv91eo1fR2pCneKG3miF5uOnuJFJgBsiF4mkQ/UdFE65m/DdNZRdchBQum5x0stWinwXwppWNzQOrqpQ7BjSV4sQDCWG7PmCmZGuePzz9fONfhz8Mba3Z3lZTFebRKwnJ8/XEKgRau3bqgh5uljFFRNj8xHmGP26n/m9HI33BngZBQWdpkE/PQxqheiNU+gymKEhJm5ptRHlRyoc/yCzaXrsUNxTKQU/znsZPvNtF/zb0VomTuO53EIYu1hFBqC4S578xKCqf2JdwWc2I6wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FONw0WfVzKsaMV8vVv++1EfIgc+QJ/oi73x2zo/SyRM=;
 b=XfbjfEBC6bTxmA4pdl3oIDGLiAt8Yw6evY3Sk3hs4GcRPd8TZ53IUPkb9abgrO4HMMNoREF0/s38SaYXTTd8ZCIlZi4rOdQ8qiv64TAqUI1+2CXXnRqB0Dd65ngTIsPJHn9NqF+ZrcycTcw/YUCEiHBB4xKrTCdn6orDK5dFYsfWYaWtFIgmqUAjeFOXUF8OFEGJl7p0ppH1zOLfgr+ItdWy8VHM5Iy9Q46UY+YU81xxpBjOGuSrK5TG3QsdQg04zAywDGqr7pHD0k0xrttVWE8kHXU6xacDpmhYsWA+9wJiCoc6DG49LU1S5Q9Jrt2ruBsHHENYpoogZz3WO4NUOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7811.namprd12.prod.outlook.com (2603:10b6:806:34f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 14:22:08 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 14:22:08 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v7 00/10] rust: add `register!` macro
Date: Tue, 24 Feb 2026 23:21:38 +0900
Message-Id: <20260224-register-v7-0-aad44f760f33@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XOTWrEMAwF4KsMXjfFkvwTd9V7lC4UW53xosngF
 NMy5O51hsK4BK2e0PfQTa1Ssqzq5XRTRWpe8zK34J9OKl54PsuQU8sKNToN4Ici57x+SRli5Ik
 hIXgg1c6vRT7y973q7b3lSztbys+9ucK+/StB/SipMOjBIzF4Q5O1/nWuOWV+jsun2lsq9hI6i
 bsMKUxjskKOD5J66TpJTSLhyDYkT4AHaXo5dtI0ySLERCk4Ew7S9jJ00jYZjR19DBotmIN0D4n
 Qf+uaFImBTZLQ5p/ctu0XQaEoecMBAAA=
X-Change-ID: 20260117-register-ccaba1d21713
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: 80f85993-9b5b-4f85-43d3-08de73b01791
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHVvTHlCNlpFaU9CY05PbzkxOS9vUnZQblRTd2ZPbGNpblhIdmVsTkM0Tkd6?=
 =?utf-8?B?aDZQS1U3SDNkc2JqNW5sdFlCcmRRZkVxMy94Q2RVcVBjQ3MvSkJwNEplS1R2?=
 =?utf-8?B?TzNXK2Jyc2xMV3NKYU9VL2JTTkNIQzViUERQdjV2bHRGUUNrZllEUUdIcG5a?=
 =?utf-8?B?RHpUUXpyOWJ3SklUUVcrUnFRdEkwRnFodzU1MFRDQ29QdEFQenlueksrTmtr?=
 =?utf-8?B?blpkaTlOR2ZkZXRsMUlNMks2Tnp6OEdHbldyUm1KNUFJQmovSmZSbURjeFV5?=
 =?utf-8?B?WU1pSXhLajg4S3lMN2tlQ0krNTNNbFFnMFkrbkkrZjRwd3ZDU1hqek9CQThB?=
 =?utf-8?B?amJsbjlST29uZHlCUksrKzhnOU5CNFN5Tnl6SHVxZm9tZ2NFdXUzNUhlUWRJ?=
 =?utf-8?B?S3gxcHFEYmRSZlB1SDhQNHRLSEw5MERnTE9IQ2pSK1FGcFdGRFNDR0l2WVBs?=
 =?utf-8?B?TSs4S1ZVWXhzd0Y0YlhCYzQ0dUlwb2FVdElyQ2JNZnNZeGY2Rko5V1QwQ0dq?=
 =?utf-8?B?R25nbXNHWWpjODlVMkY0bGplY09rRSt2d1dmSlhnTjZFWnNMU0krZ05JaGxr?=
 =?utf-8?B?NHFYS01ORkZMV3pJcjRCcisrdGhRaG82OVRmQ2ltMUFseXgyY3E4RkNFSG5p?=
 =?utf-8?B?QnBIVWl0ampVdmVKMEUzMGYzaGJZQmxPQWEwTHphd3l1VUlEM1JPKzNDMWUv?=
 =?utf-8?B?bXIxRDBmQUdoMVBQOEpvbU9uMnAxVU9lUkpicFRCMlNWTENkZWpLaHhXZ1Fx?=
 =?utf-8?B?UEtXbm55R0JLMkNCOS92MUlGeEZMemIxbUUwTWtiVWU0QzZFS3FheE5CMEZS?=
 =?utf-8?B?aisvTGhOUUFwWlZYeSt1QVZRVnNXUWFod0IxQzkvZEdzb1VUaG9CZllBQnpn?=
 =?utf-8?B?SUdDRnN6VlZJaTljek9kNkZCTXZwdE9ocU9XRVMyWVZjZFp0b1lXM1M3cmhO?=
 =?utf-8?B?MzF3S01wczNWVGI4OW83V3R3SmR2Q1VwLzVKWVk5U2N2WWZ6dUlwOHNZNGsr?=
 =?utf-8?B?WVFSaWdtWThnUjV6cFd1S0RVQWlZU2s1RjVjTE4yc3d1TWZ4cVFpeUdZQ2NN?=
 =?utf-8?B?K3N1bHlHTWNDQTV2RWt1TTBVMzBGbWJFTzRFZVFWV2FON1Y4aUF1aUxZLzhO?=
 =?utf-8?B?MUNzeEJWemwvK2FlNVlXVnpYTmlFMmwxSHQ0WFVwWnNoNUU4eWFiV1h6Q1hw?=
 =?utf-8?B?UElZbUphWk1zcXVteWdoZmhNcXBUVlVUdGY3cTMweXVMb2ZyeThwT0poTjlI?=
 =?utf-8?B?bVlIUjRkUEtxTllLRlduNGp1UVZOZWZWZGUwNmlSaFIrbGJZNzA1WmM2aU9w?=
 =?utf-8?B?czRhV2I5WFRvMFhmQTNUZGpnMHFyNUV0MHNlNS9iZkErR20vNUZ1aUhGa2sr?=
 =?utf-8?B?NU90dlN1QnAwZml4K2ErSDZKcGZCenFRbElXb1hqWmMrZkhEZzhMaVNOajBq?=
 =?utf-8?B?RGQvN3NsNGpKTkIxZmJYVW5hS3FqUnhCUFJrSjdIM0tiTU9GaS9GdFkvT2Uw?=
 =?utf-8?B?OU5BbjNtc1ZGVURubW9XQnE1aHFhL1dLVUp2ZWF4dWQyanMzYkR2dCtWcFlI?=
 =?utf-8?B?RUhEdjRXUGwzblEweGZLamNMT0t2MGZ0UVp4bnhEZ3VuWU8xMVhmVFdyVDFj?=
 =?utf-8?B?ZVlvUmhLTW9zdFJzOHlvNVYwSjU4SkRDeDU5Vm1EZ3MwS0RYb3A1dFZJWkJt?=
 =?utf-8?B?dTcvU3pja0xGd1JXUzdCZ2xKYnpNM0hyRU40WER3OW9XWkxKNVQvKzZHYzdh?=
 =?utf-8?B?TUZLTkpOZDdOb2RMTEFreUhpMlJHY0Yxd1dZSHFpSTdBbCtsS3owaGZGckhG?=
 =?utf-8?B?UjZkbmxlRjhxeFltVFZBMStiZkdEbG5TdmhicDNJNU5nUm52ekVXRXpONFpE?=
 =?utf-8?B?UGhlOFVNUjhKdllyS0hDbldaNnFGTEM1VEpFL3lzaDFUNGNyZFE3U3FlUm5U?=
 =?utf-8?B?TE9GOGZYVHRvK0M3bFJSOERlQVdiQ1c3Z2VPWVowbmFVQkp6SkxNd3VCbWJi?=
 =?utf-8?B?UXJmTWE0YVg4L1pSUklIQ0hPQlhUTlRwYlVVVjR5bEpqUTV1aHNWRHJISmI1?=
 =?utf-8?B?WklaWlRwQnA1OWduZWdGZVlkY0pzYVRwenI5bnU2MGlmZ04wejExRXRxbm5K?=
 =?utf-8?B?eFRhNDdsMjZRRmJSeWxZMjJGVW5CVFRxVmF0Vk56SnFiaXVYUXAzWE1RQkI0?=
 =?utf-8?B?d1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2pxRThTTHFCMXVpclZSMjNKa1N5bDJidE8xNkxTUWRscGdWM0xqODlCYnF4?=
 =?utf-8?B?bXo4Y0tGaDkyTkwwQ2ZURmNEWE9IMDRVbTNYUWJQbEc5eUhKMmdmckgwcUxw?=
 =?utf-8?B?M2loZ3IxMW8zSXJuaHFVQ1poTFpPNjNpK0dGcFFNNDhVQ0J4MWI0NXBwM28y?=
 =?utf-8?B?NWNHT21Ya0VBT1ZiaEEyRmhuMEpGdDZpaUhnbGU0eXNDR2w1djcwelJwdDFV?=
 =?utf-8?B?V3M3K2VEWk9EZlhuUzdieFIrWHUxY0VGSGlpMlc2cEJ6c2RJcXM0bGdwc1ZB?=
 =?utf-8?B?bzRWNDlqQURTNlZyUExGR0FjUGlFbjA4TlBCaG1USG85QW5scGNxamZ3WkJs?=
 =?utf-8?B?MEQ0dmtYSy8ySm0xSzUrdnVoRUhvU28zUmV4SlJiczhFT0FvWGc1SjZqZGIw?=
 =?utf-8?B?OVBHdUFOOFBHd0pKREIzcTlINlcyUVRMUDJQWHFTYTFyeWtaTDJoWUNNZEw0?=
 =?utf-8?B?Y3V0Q0ZwZWlxUXBhakdENEtFM1JBZTFnRG1adm90QytVQno2VG1XYXgwWE9W?=
 =?utf-8?B?eFBaOUtOYW5UdG04ejlmOWRIMXN0clJ4V3lMOC9YSW5JaHc2R2lmK1dZZEJW?=
 =?utf-8?B?WUlIUzNIWG1SSWs0Smc0cHM2dXFNT3ZFMFduWis4SmFTMXpYcG8zWm1abFAx?=
 =?utf-8?B?cDRhd2FnQnMyeUgzWGNINWhVdUJZYzc1MitJWTA1TlpGRmZmckRhU3lnd3RK?=
 =?utf-8?B?QWF4T0pLU0IwNFlEbnpRRE9IUXAyK0JWcyswSmFXSy8vVXRKUzFYdW9tbkV5?=
 =?utf-8?B?U3ZhRGdkVWVYeVRpTnA0c3BqUno1SnExdjJUQmlsRUxnS0pzVmlJTkhKY1NL?=
 =?utf-8?B?cXh3eHFGMHFjQUtoOVYyOCsxVGIzTW9hdnZSWmJ4MXFVYUNuTEtpZXo5MzI3?=
 =?utf-8?B?ZVQrckQ2OHdpcFZiU1FFQnZBMzNldnJpeXB3QnFYbkFvTlcyd0d4Qk9SVFFk?=
 =?utf-8?B?ZDFLazhGV3M0SkRrUlRQby9kWndrZCtqUE9JYXJVVW5vSUNSakkwSjBIMlEz?=
 =?utf-8?B?aUNVTTNPSVA5b2gxb25qMUQ1YWJqN1EzMUxYelpTVEVOTTJtQ2tlNXFwWUlE?=
 =?utf-8?B?Uk1pbGdXaG1xUUw3cWhNSlJuYWUvOHoyNnUwdGdOSG1ZTGVzQSttbjRaWC9z?=
 =?utf-8?B?Zmc2dWNUamtaa0dxYWhTYVNqdHBMWXhORlpkYnloM1FQa2hkeFJGQ1kxMEd4?=
 =?utf-8?B?R3p0VVR5NlNGa3RnSDRxRGZHcVBOekhjNFIxZGdWWjJBMjE4RzFKMmZWYXRr?=
 =?utf-8?B?TzJFWER5ZVZlbDhScXQxdk9TQUFpaXRTQ1FMNXNnRHJYNjVJRlgrRjljeE5j?=
 =?utf-8?B?WFdKSGJUNFBhSENzL2dYd1ZodUpSTGxpQmpNK2xDT05vN3A2WCtrR0Y5VnRi?=
 =?utf-8?B?TDBQbFRxRnFBSGRWd08zUWhPUnAwZVlaMEF5K0EraE9EKzc0YVVMNE56N2ZO?=
 =?utf-8?B?amJRZ21mTXF0WEpvYUc0emhqdUNKWmQ5clJyTGhrN2grUmExQ0lKTlZGa056?=
 =?utf-8?B?UE5uZ1lmTDYrMnF2QktPUm1SczI0UEVDUGVPNTFXZEhHYmhPUVRvUDJFWlRj?=
 =?utf-8?B?UERhSmN2NUFXVTZicEN6M0tjYjdudG5rcENXWVJHVytoSHVSeGV1YVllNVZ3?=
 =?utf-8?B?VjkyTW5rTm4zeXowWmtrSU1ZWFp1SFVsM0JyMjNmZ0lPNGFsY3RneTloemhh?=
 =?utf-8?B?Ky9GbWlXc1dpdE82RVRERVI3d001aWEzWEd4ZFZaWHBXaFgwanVHbjVESWNi?=
 =?utf-8?B?MDdJbWprWks3SlBibWNRcHUwUHM4T0Y5anh3SWNzV3dwM0ZBUnZOdDFoS1FC?=
 =?utf-8?B?YW9mVFJrdWtrdGFneFpxUXM2ZVlqVHJ2QjRwVE9LeE5VdTJMRWhyeUVwVmRM?=
 =?utf-8?B?Y080aU1DT2NqT1VRNnlSWGwrVThFMSs3WkhrRVl3bmN4WjhUdWp3STBJWHFR?=
 =?utf-8?B?SjRaa2h3QUdRYXh3UzdObmlYOG56cTZBS0NkYlFhd09lZlM3YW5TTHMySEps?=
 =?utf-8?B?dHJ6SEVadDY1NU9PNmZaSkJmVFpXbms3T3RIRTVkREN4MkNlNlJtZjRoNDhR?=
 =?utf-8?B?ZnpCQWd4U0gyME9YSmlXMVBsdjZMMTZBQ293bVVHWE9vQTFKeWZvdERPdUR3?=
 =?utf-8?B?TmNNUW1GdjlTVTI1cUpvOXk5Uk8rUnAzZTlGa1YrdHBubHhvdUpjK2dJMWhI?=
 =?utf-8?B?aEttNVZRZm1HYm5DUXhnQ2xQV0VaVk9SMlhySmltckljcTFIU2pYMzROWVhT?=
 =?utf-8?B?YklJTmF2bTh4TElaSnlvU2dvU2drZURHV2JrUmpzWVF5ZHZmT0J3Z0lLMmd5?=
 =?utf-8?B?d25tV3Vxb0JxQ3RIZE9wRWpmWDZrdXBNREdPZ0pOTkNMNjFRemwwRnBnN3FW?=
 =?utf-8?Q?PBYXhQVA9tj+sMkZwYYJHEEcgpcR7aR3E9+ZynuyQFidh?=
X-MS-Exchange-AntiSpam-MessageData-1: Q/eImmtM8wG5MQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f85993-9b5b-4f85-43d3-08de73b01791
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 14:22:08.2033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9EZN3T+B7a7euW/Rc2Do2gsMiptdWYL+U9GnlW3Qkwi4AfoflOIuarQ0t2sPA45dZ/svoo/X/5H/0T2nno8EZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7811

New revision addressing the v6 feedback - the use of "location" instead
of "reference" in particular reads well both in the code and the
comments.

As a reminder, since the previous revision we use the I/O type to
perform the actual I/O instead of the register type, which moves us from
this access pattern:

    let boot0 = regs::NV_PMC_BOOT_0::read(bar);

to this arguably more natural one:

    let boot0 = bar.read(regs::NV_PMC_BOOT_0);

This revision is based on `driver-core-testing` as of 2026-02-24 with
[1] applied. A tree with this series and its dependencies is available
at [2].

[1] https://lore.kernel.org/all/20260206-io-v2-0-71dea20a06e6@nvidia.com/
[2] https://github.com/Gnurou/linux/tree/b4/register

The first patch enables the `generic_arg_infer` feature, which is
required for generic type inference and used in subsequent patches. This
feature is stable since rustc 1.89.

The second patch adds `shr` and `shl` methods to `Bounded`. These were
suggested by Alice during LPC as a way to avoid the use of the
controversial `Bounded::from_expr` in both the bitfield macro and the
Nova code. The third patch adds another convenience method to obtain a
`bool` from single-bit `Bounded`s, while the fourth patch turns
`Bounded::get` into a const method in order to make register setter
methods const.

Patches 5 and 6 introduce the `IoLoc` and `IoWrite` types around which
I/O accesses are centered. This allows registers to be accessed using
the same `read` and `write` methods as primitive types.

Patch 7 adds the `register!` macro and the types it requires.

Patch 8 updates the Rust PCI sample driver to use `register!`, as per
its TODO item.

Patch 9 illustrates more extensively how this macro is used by
converting nova-core to use it, and removing the local implementation.
This patch is to be merged one cycle after the other patches.

Patch 10 is an RFC allowing a shorter write syntax to be used in the
case of fixed or relative registers. It doesn't need to be merged
immediately, but I think it is a good time to discuss it.

I have also removed Gary's signoff on patches 5 and 7 to make sure it
doesn't get merged before he gives it explicitly.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

---
Changes in v7:
- Use `RES + SHIFT >= N` instead of `RES >= N - SHIFT` in
  `Bounded::shr`.
- Rename `IoRef` to `IoLoc` and all related types
  accordingly.
- Use `Into` trait bounds in both directions on `IoLoc`.
- Add RFC patch allowing fixed register values to be used directly with
  `write`.
- Link to v6: https://patch.msgid.link/20260216-register-v6-0-eec9a4de9e9e@nvidia.com

Changes in v6:
- Remove Tested-by tags as the code has considerably changed.
- Make `Bounded::get` const so it can be used with registers.
- Use the `pin_init::zeroed()` const function instead of defining our
  own method.
- Generalize all `Io` around the new `IoRef` and `IoWrite` types, and
  make registers use these as well.
- Use the more natural pattern of having the `Io` type perform the I/O
  access instead of the register type.
- Convert the whole PCI driver example, and not only the PCI
  configuration space.
- Rename `Bounded::as_bool` to `Bounded::into_bool`.
- Drop `Bounded::into_inner` in favor of making `Bounded::get` const.
- Link to v5: https://patch.msgid.link/20260129-register-v5-0-c4587c902514@nvidia.com

Changes in v5:
- Rename all setters to `with_*` and `with_const_*`.
- Use `, stride = ` to specify the stride of register arrays.
- Remove `Deref` requirement on the `RegisterIo` trait and make it
  `#[doc(hidden)`.
- Simplify the top dispatch rule a bit.
- Link to v4: https://patch.msgid.link/20260128-register-v4-0-aee3a33d9649@nvidia.com

Changes in v4:
- Add `with_` const field setter methods (removing the need to call
  `Bounded::new` for constant field values).
- Add `into_inner` const method for `Bounded`.
- Add `from_raw` and const `zeroed` method to create initial register
  values.
- More documentation improvements.
- Link to v3: https://patch.msgid.link/20260126-register-v3-0-2328a59d7312@nvidia.com

Changes in v3:
- Sort the Rust features list alphabetically.
- Rebase on top of latest `driver-core-next` including the new Io trait.
- Allow several registers to be defined from the same macro invocation.
- Remove references to `bitfield!` macro.
- Fix doccomment of `shr` and `shl`.
- Use `+` syntax for relative register offsets.
- Move register arrays size and stride to after the backing type declaration.
- Use regular doccomments to document registers and fields (thanks Gary!).
- Remove `Default` implementation and implement the more predictable
  `Zeroable` instead.
- Improve doccomments a bit.
- Link to v2: https://patch.msgid.link/20260121-register-v2-0-79d9b8d5e36a@nvidia.com

Changes in v2:
- Remove `bitfield!` and put its rules into `register!` to give it more
  time to get reviewed.
- Allow output type larger than strictly required for `shr` and `shl` on
  `Bounded`.
- Enable the `generic_arg_infer` feature, required for rustc < 1.89.
- Link to v1: https://patch.msgid.link/20260120-register-v1-0-723a1743b557@nvidia.com

---
Alexandre Courbot (10):
      rust: enable the `generic_arg_infer` feature
      rust: num: add `shr` and `shl` methods to `Bounded`
      rust: num: add `into_bool` method to `Bounded`
      rust: num: make Bounded::get const
      rust: io: add IoLoc and IoWrite types
      rust: io: use generic read/write accessors for primitive accesses
      rust: io: add `register!` macro
      sample: rust: pci: use `register!` macro
      [FOR REFERENCE] gpu: nova-core: use the kernel `register!` macro
      RFC: rust: io: allow fixed register values directly in `write`

 drivers/gpu/nova-core/falcon.rs           |  249 +++----
 drivers/gpu/nova-core/falcon/gsp.rs       |   23 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs |   65 +-
 drivers/gpu/nova-core/falcon/hal/tu102.rs |   11 +-
 drivers/gpu/nova-core/falcon/sec2.rs      |   17 +-
 drivers/gpu/nova-core/fb.rs               |    6 +-
 drivers/gpu/nova-core/fb/hal/ga100.rs     |   40 +-
 drivers/gpu/nova-core/fb/hal/ga102.rs     |    7 +-
 drivers/gpu/nova-core/fb/hal/tu102.rs     |   22 +-
 drivers/gpu/nova-core/gfw.rs              |   11 +-
 drivers/gpu/nova-core/gpu.rs              |   36 +-
 drivers/gpu/nova-core/gsp/boot.rs         |   11 +-
 drivers/gpu/nova-core/gsp/cmdq.rs         |   10 +-
 drivers/gpu/nova-core/regs.rs             |  544 ++++++++------
 drivers/gpu/nova-core/regs/macros.rs      |  739 -------------------
 rust/kernel/io.rs                         |  347 +++++++--
 rust/kernel/io/register.rs                | 1135 +++++++++++++++++++++++++++++
 rust/kernel/lib.rs                        |    3 +
 rust/kernel/num/bounded.rs                |   70 +-
 samples/rust/rust_driver_pci.rs           |   84 ++-
 scripts/Makefile.build                    |    3 +-
 21 files changed, 2118 insertions(+), 1315 deletions(-)
---
base-commit: 545225ee0b0b6998c7b6ff888f8497681b8b35c4
change-id: 20260117-register-ccaba1d21713

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>


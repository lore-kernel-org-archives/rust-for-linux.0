Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013029.outbound.protection.outlook.com [40.93.196.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682A341C62;
	Tue, 17 Feb 2026 01:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771293313; cv=fail; b=GROvgbhBDaWNntLlrbceLqRTAHQnbrXbnm5ry+LyV8IppKosBLQvHwQgmp8/iaOBIVzGW1Sk2vJyMOWoFnISUsIKC8OmixruuX0XEZpPeLSZb6r7pWFCuwoBP0lR9A/iD8hdwpJeotn29VslstSbxhzLT2dNlXaDndZlFkd2EP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771293313; c=relaxed/simple;
	bh=h4KMsMoBWuPFHJdKhtBUpSpOriA+hVZkdLDrvSnL/AU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=cdzrA5lVpNsxrEu0KX1KwgGlzpTNK8rGw5yAVdayS0lfhQPAXh4+q0Yg3ipohPnzPCKDCDsE8dqz5/yr4bCE9obH2ro22ZRsylWSHA7qPWmvC8NlSI1AOtPni5y4Ht1qq6DgtACwkRM/kRW5qyJS0wUI0wPm6hIXkQt3ZiusDsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AG45Pq0q; arc=fail smtp.client-ip=40.93.196.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AG45Pq0q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=th2o52++NsLmvVnJholLZlK3GvXtR6swgD65KKPbUzvT0o1V5fk7rKcly8WDXD5u5uoMupTPXcCh5bfLobLi6Y1TwcolGQZV0iy+7BYU+gHdUiETlvMIGoOg1iXl20lnHD4mifGuRUbPcMJdVvf1hFZo/z4F4LGTbzw/uoEGkWN5hLnUkBcWukktUbzWWBzemMomZJD61XyPcXp2kbjBldG446NxUqGjQJ2ekx3CI+BXbqw5k6IKGZpZ/V0Y/Yri6b63W9LQOGpQwMkQWHLm4Ck5MIwuOD1vuAGJFYpwHitGDhR+s2CjU2XdI8Wbe7A8h262BdxC4I2W6lIJaiF+iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0l2wxJarasBZy5/Y24QxLJBwdkEbs6v0hSAuBUjLNM=;
 b=qyx5f+1G2BXlfbSC0rk+CHwnXpd7kWMCw9Wn/gfJfF6wUwdD3ERcSGWp7FlJuiGwyyQEBPVY7FoqhVkj39dIs4ncKeR+1dm/Y9QlqtTlu3lnbcxQfKaHOwYjqlM1hZ2HytLiuW+qN4cKn2539Fxn2AoGdc8+EDVJeTwSscOgv0gBJCieP4tgmuKV3hBMg/hWWrfz8L5AOx+3vnqw9tV528DHAUSyirQEfoaLS4pE6DsYgWqL/fq7BRmpsjKGi/3STaiWwkZbKI9GX/nZ3XOYAk8jvuROS8mb6GhiKkDgFRpD/HOf0v1GAj9BR9FAIsq2/sSiV+rUAEdIpi08X1zU/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0l2wxJarasBZy5/Y24QxLJBwdkEbs6v0hSAuBUjLNM=;
 b=AG45Pq0q3e+1Nqin1zj2Vw4ThgVM1ODGLzXPyz8O6iYbGLuCwnhA+9xfGzycZ0tjirA6LV0ah9X3ucwkC6q74akTYTV4+9Pr/pY5EG1tImiiMDPdi939dvJaAWL2wL0N+JVfVRJzpEQ+hCFS66ks56RPX14yJO2KvEDmTdXgr3n5F/yWEFLfLUp2b2DtqBGarWu4AJiHivezCgNYQDBzS5VByUz41xIBJcaI5keWYI419KTyA10QDpAvdsyw4/P8giWWuARz2ejQ4nSescGiAmlK5Mef4BvkqqP0f49ONAivaZahts5SICmAIgLLm00CU6XSHXrHXIEU89PP1Zo9/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB7580.namprd12.prod.outlook.com (2603:10b6:208:43b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 01:55:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 01:55:07 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 10:55:04 +0900
Message-Id: <DGGV2METTDXF.1BCNNP5T0TPV3@nvidia.com>
Cc: "Charalampos Mitrodimas" <charmitro@posteo.net>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/4] rust: macros: add derive macro for `TryFrom`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Jesung Yang" <y.j3ms.n@gmail.com>
Content-Transfer-Encoding: quoted-printable
References: <20260129-try-from-into-macro-v5-0-dd011008118c@gmail.com>
 <20260129-try-from-into-macro-v5-2-dd011008118c@gmail.com>
 <87h5rxuw1n.fsf@posteo.net> <DG7C1LYQ4SOQ.1HBJ8WH923JHW@gmail.com>
In-Reply-To: <DG7C1LYQ4SOQ.1HBJ8WH923JHW@gmail.com>
X-ClientProxiedBy: TYCP286CA0254.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB7580:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d07b9a6-002b-45be-2c74-08de6dc79370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WDdCQTlFaC9DcUkvWnZFQ1FwMWR2dE9ZTi9jblQ0Z0NWeXBGbmN2d0I5RDh1?=
 =?utf-8?B?QnFjNlRxTHVDQUZtKzliSk1TcUNNQzBGZWRWSm5ic01yRFFuYUhxVVJuT3R6?=
 =?utf-8?B?ZGNNYmJNVnMzaHFCbXdXb3g5TkZzOHNHazZzSHVaVk4yNWJPekRBWHhJVkQv?=
 =?utf-8?B?NFh4K2MxVnRnQ2ZIaWZJN1hUdTFFb0pZNjlBbEpVbHNrTE5VeVN1NXpYNC91?=
 =?utf-8?B?L2h3NXZaR0hCZ0pPanBwWWs4TEI3SUFrRjF2OTlGRkRmUXlsb1dwTVg0d21R?=
 =?utf-8?B?M2J6WjlkT0ZNcFl1TTFjbktIWmpOdWh0YU9GcjBWbURXQm9MaGNMT0Mxb3hz?=
 =?utf-8?B?eDhudkt1ck5Zc2xUQ2xaYWQxazhROC9FSVBXNUtYRDQ1TkRGVWV4WTBoOXVF?=
 =?utf-8?B?TWI0OXZ2VDlzTlpPN09xdHFhS0l6UVZOd0R0UFUrYjIrUUY1dkhNVnFEaVFX?=
 =?utf-8?B?UCttVFY3MVp1cWdJL0QxTEpzeWZwbm1rd0dydzNxY25VOW5tclFsQnFGQXdw?=
 =?utf-8?B?akVjTmUxRlBFTHdSUEpsbnJOK1FMRC9TK0VackxodDNWK0dMckpYKzdYV0x4?=
 =?utf-8?B?SVlXTWxTdmtXSnhqVFVJWmlzWW1lc2RtblRYZWVBRnArRGdJUFRCR0dKL1FV?=
 =?utf-8?B?Qkk5d29BNHJ1TkFIcCtuVDBUNVhJYkdrbDNTT3BTY0tGN1J5SUZ1Y1YreG9x?=
 =?utf-8?B?bHR4MUhzbnpDaGNRblNTRHR3TDdkTkh5WTU2Z1dDblA3Y2g5ZmM3NkdoM0Fv?=
 =?utf-8?B?eTUwQ3VWdjIvUUFYL0tsczlIZEpRYkkyd2dMNGRCMDBNT05WM3VnbVRGYnY5?=
 =?utf-8?B?QzVhVytiQVlhQ2FHWmcwRmdLZGdlWnpPMzRmczRqVFI5R1pkM05qMGJ0MkJG?=
 =?utf-8?B?UlNFbDE5RVUwOFN2S1pmSzloZDFSNWZtT3Y0NEk3b0M1OGpuaFRMNEpldFVr?=
 =?utf-8?B?MVBHV0djU01sVGxkTk9xUkROTDhqWlBDT0JtOWNHRERUSDZFMG9tcDE0Zlh1?=
 =?utf-8?B?WXF6c21Gb3p1OTFDcndnQjh0Nms3VEp3ampuSHdPVU9zeG55SXdmMjJtajFa?=
 =?utf-8?B?d0dpeUxvUW1XL25VcWtxcmorNkZWaVE3NE4zU0tJcm1vQWlDRk4xZ01WRzB6?=
 =?utf-8?B?aEhMUktmbnJlVk43SkhuSGxtUFlQbWYwa1NPRFBhbWtMWWc4S0VTcEJncm9D?=
 =?utf-8?B?TGNkc2drTk9zamJrOFVBbVpBazljRm1TUlgxMG9NNlVxWGpSWFJML0Roc1g3?=
 =?utf-8?B?V09UL2xoeTFYYzZ3VFN4Yy9Tdy9QWmdOOHA2UnZXd1R6UDIxVUFMcTZBQ1Fw?=
 =?utf-8?B?b1BoZk9tUC9OVmVqeTQrYXVCdEQrWHNYYmJZNWpNYzAvU3Q4T09wSklUSEJt?=
 =?utf-8?B?eTJFMmRhQXdZdHZpZXdlcmdJeGlzeU1CdjdaaCtGeHdqK2FzbHBFSHk4Sk9K?=
 =?utf-8?B?eGhhVHhldXpNMW5LcGJ1VU5YOTNQc3NsZGp0NytCSW9pTlJyUmV3K08rUmFq?=
 =?utf-8?B?SEVuMEZsWlBxOU9tZHVScDA0bVUzd0Nva01oYTk4SE8zc1FCaUVhWm5JdjhB?=
 =?utf-8?B?eGw5cUl6YUtrL2RUckRZYVBuY0M0Q2pZSE9hMlpSbXdtYkZYRFJzeFlaNnVm?=
 =?utf-8?B?cVVnbTAvbXBEU0d1MC85YUJ0SUw1K1FXbEJLSWFvZmFIK21IcmVkd0NxS2Vm?=
 =?utf-8?B?cERoeTZFV1ZtaExoYlVodnlZK1Z2OHZ6RzZhckNGVG8zS05BNUdBb3phOG5r?=
 =?utf-8?B?M2xkcEcxV3BHZDNQVkt1b0V3VXpaTm1oWlM1bmRFVTJpQlFmQnVhZ05KMVVQ?=
 =?utf-8?B?WjczQ1I5UjV1bXovNDludlJaRXpvM1BQL05GQ2ozOC8yRDg5VHlaTjVOVmJr?=
 =?utf-8?B?aUwrS2wyTGhTeTRZaWpYMzdmdk1COUhxSnk3RjE2cFJOWXFtMTJHdmdHY3Fw?=
 =?utf-8?B?aUpWVVBPZjBIb0xLMC9wWW9KaHMxZ25OVjdzQzJMdk8zWFI1RXhEQnI1YWIz?=
 =?utf-8?B?WXlHcmxqVitUK2tvQ2hJb1paRUJqeXJVcFJXVitNTVM0ek51R2kxTzc4VUg2?=
 =?utf-8?B?Qm9jc25WM0xCSFVTbDZhWkh2cnJ0bVB4ajAxUUErYzFFQmpsR1F2QTJaQjQ5?=
 =?utf-8?Q?Oh0M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGhva1VyOFFWeSsrUTA3SFhUcXlOa3ZPYk5ZelBuNWwvb1I1c29uaVZhbjRz?=
 =?utf-8?B?cExKVlRmOEREazdYTy82eDVkZmpsbXBxeXNtUlcvdFZnK21tTVhjQ2xzd0hO?=
 =?utf-8?B?TjFPQUJOY083TFNNUm02NDdCRkNSV2ZCdU55Nk91aktxaEFmZWlndE1ybUNV?=
 =?utf-8?B?OEZXQ3hGaVFnUTFYWnNKMTIwMFkra24rSFRtTnhFUE9Mc2pvK0dTcC9qQi9I?=
 =?utf-8?B?MEVPZlBCYlg0N1VtUmoyVHNxRTNyK0F4MGU2cy8wenV6a1pSUjdqY0pHSk1Z?=
 =?utf-8?B?WWw1SWJmZGJQVmtEN29uOW40VW1sRmtEcFlHaUlLT091ems3dFFFT3JKVHNj?=
 =?utf-8?B?Y2FlbTVJbDFNQ2JxNG5yL25iYW1ZU1pRTmlqNVAvazFORkZZWUZ0WWJYZnNF?=
 =?utf-8?B?Nkh0NzFQTEVvNmRST0NDTVo0YTh5ckJhNVFnZEhzMFcreVY1bXFrdGdTMzRW?=
 =?utf-8?B?emd4N3VUNGNnWk1nU08xcHpINmp6SDFtQzFXdE5rbld5SkNmOTJkcWtqUnZw?=
 =?utf-8?B?UmhoaDFBR0U0aDZYL3E0OVhxQ0lPaEo0QWlIa0tqaExGd2F1N1N3Wks5RzE0?=
 =?utf-8?B?Qyt5ODdkMTFhU2MzbWpOOWZLM243RXdNdW5XTndTZG9USWUydmhwQUtzWkFj?=
 =?utf-8?B?eTB5Lzl5R1BKUHVCSmN3M09uRVAvQ3U2YVR6QWJHcVZ1ZVkza0pCZ3FmNytZ?=
 =?utf-8?B?TzlSRDNJTEk5WFd0dFRSaFNGR21qUVB1WFFtenBON2IwS2NMRytOdTBtL3E3?=
 =?utf-8?B?amVzck1VdlhqMlE5TjFaQnBkV3kycU5RMFpvbTVPcWdsdFZTSkkxaW9TemVQ?=
 =?utf-8?B?M0ZpQms4NGhXYUFxRml5V1VxWFdLempVTGh3bEVwS2srNlRtMVQ1MmhlSzJx?=
 =?utf-8?B?K2pmVlJudkdMWFlaekl4eHlzV3plcE9UaWVMZTNHTW8yNFVtb2hLbDRyblp6?=
 =?utf-8?B?NTBnNlhTWnJTaXRFTTZIY1FWdDl5anYweUdaOGVBMzRFbUpCaXl5SHNGeGZR?=
 =?utf-8?B?VTJBcCtQUGlRSWhJZlRoVTRVNWhwSmhONGNsODhXazRwbis0ZVVZWnBNK21G?=
 =?utf-8?B?dEIvWjhnOFJoOStKSGd5NmxlTHppeVRlbjN6a05PblpCSjE4TnozRGdWajF6?=
 =?utf-8?B?dkNUdVc0dnQ3cE9TZGZRYVl3Y3JMU1B0OXpOd3IzK0wwNlJKMVlxN2QrRHZN?=
 =?utf-8?B?OTJjZmk5NFhYN2xCM1JBYVlNd1NxcXhMVFJUb1k1QTVNaUlJRjNOSkdhK0dy?=
 =?utf-8?B?V3BSNXREbm8zUU9yaVlOL2gwcG43MFFWZndWVVJVK2kwYnZKdjlTWThQaTlm?=
 =?utf-8?B?bHMzY0x0RFlPL2JIWkZxUzRtZGtBNGV1VGtOZjNKczJNNzJCaW5hbGJYR1kw?=
 =?utf-8?B?ajBMc0hpU0dKWTlmUisxcVlNTTJYR3A4bm1lT2ZmNDcvYzVQZjRSb3JxRE1m?=
 =?utf-8?B?aHRjMGZWNFZPM1E5VlZYQXhGbWx6TWxVN1FpWkE1b0RpVUQ4QjcvQkZjWlhW?=
 =?utf-8?B?blBsQ1Bmb045cjZjU1F5dk9SVktKeEZSc2ZMckQvQ1F3OTNYeUVmcmx3QWpT?=
 =?utf-8?B?aGlNTnl2UlBNMUJDU1FpdzZDUG16WURCMVpKVEN4WXBreXdnR2s3aThUbUpJ?=
 =?utf-8?B?bW5aL0RjeWZHbk1VQWVpTzR3dW5UVlZtMFcyRmtKeSsvU2FqSXlQRDB1aC9s?=
 =?utf-8?B?NXp2YnlkeFZoajhmemdERUR4MTJ4dXJRY3dWVTFTVDdndW8yM1B0TWtXdW44?=
 =?utf-8?B?ZVhoYzBkQkhHUytPc1FkeE11K25lUXBDcFowTk1JSGg1YmpxRExPN0pRMUFo?=
 =?utf-8?B?aWtvakhpdi9QWjFFekkyZkpVQ0FoK3BJeEhkQmp4aXZDYkVRZUxNc3ZiQ2Zm?=
 =?utf-8?B?UFBmZm8wN2J6U3N1bGpIRTQ5RmV2NnBPOTRuellhdllhVGpNNE9CTmNNTjFM?=
 =?utf-8?B?MEltSVR4YmsyS1JkK2x5THhBT0ZhRlRUeDQzdkUxSlBrdnFIaEdRN2J4M1E0?=
 =?utf-8?B?bkJUK3Z4ZVh3RVYzSS9lcnpBUndPcXpNVnFtQmloQUVhUjR0d2lCUVQvUThx?=
 =?utf-8?B?M1YyWkdtQm9LTHJOYWEra1JweFhxOThVaUZHV09RQWs5QlExKzRIbXBERXEy?=
 =?utf-8?B?dWFVWWs5V2hDbGlOQ3JjMEUwL21UTmJZOURxSzlrSmRkNkpHeFd5TVI3RVRi?=
 =?utf-8?B?alR2V3dTektxWldqa0hMNnpIaDhjeFpPeVZOaEdrRjJNbXBzZnllQnBnUFhQ?=
 =?utf-8?B?eFBiVVZtVUw2clMwZy9OYW1xTFR4YzQ2SEtaUk1oMStYSzJ1d0c2elV6a0o2?=
 =?utf-8?B?WUc5N0FwTFZMOU55SGZLQzBFa2c1eXVQdmNLamJwZkhiU0tHeHRHNlBod3l4?=
 =?utf-8?Q?l6c1wKr4C5X+PXwMsXNP0UrB1+mYOVVzlIpbqoNRcjv8L?=
X-MS-Exchange-AntiSpam-MessageData-1: GUQWElawvMf+/g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d07b9a6-002b-45be-2c74-08de6dc79370
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 01:55:07.4658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8OxAnVEW6FfzQXNqxISEAtgwSHTdqNKAVVze74NaQ1djLiSJUGUCMz/3vEgZrUm53jrE04H4T6lzZ4oUKGfxXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7580

On Fri Feb 6, 2026 at 6:06 AM JST, Jesung Yang wrote:
> On Wed Feb 4, 2026 at 10:39 AM KST, Charalampos Mitrodimas wrote:
>> Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org> writes:
> [...]
>>> +    fn impl_try_from(
>>> +        enum_ident: &Ident,
>>> +        variants: &[Ident],
>>> +        repr_ty: &syn::Path,
>>> +        input_ty: &ValidTy,
>>> +    ) -> TokenStream {
>>> +        let param =3D Ident::new("value", Span::call_site());
>>> +
>>> +        let overflow_assertion =3D emit_overflow_assert(enum_ident, va=
riants, repr_ty, input_ty);
>>> +        let emit_cast =3D |variant| {
>>> +            let variant =3D ::quote::quote! { #enum_ident::#variant };
>>> +            match input_ty {
>>> +                ValidTy::Bounded(inner) =3D> {
>>> +                    let base_ty =3D inner.emit_qualified_base_ty();
>>> +                    let expr =3D parse_quote! { #variant as #base_ty }=
;
>>> +                    inner.emit_new(&expr)
>>> +                }
>>> +                ValidTy::Primitive(ident) if ident =3D=3D "bool" =3D> =
{
>>> +                    ::quote::quote! { ((#variant as #repr_ty) =3D=3D 1=
) }
>>> +                }
>>> +                qualified @ ValidTy::Primitive(_) =3D> ::quote::quote!=
 { #variant as #qualified },
>>> +            }
>>> +        };
>>> +
>>> +        let clauses =3D variants.iter().map(|variant| {
>>> +            let cast =3D emit_cast(variant);
>>> +            ::quote::quote! {
>>> +                if #param =3D=3D #cast {
>>> +                    ::core::result::Result::Ok(#enum_ident::#variant)
>>> +                } else
>>> +            }
>>> +        });
>>> +
>>> +        ::quote::quote! {
>>> +            #[automatically_derived]
>>> +            impl ::core::convert::TryFrom<#input_ty> for #enum_ident {
>>> +                type Error =3D ::kernel::prelude::Error;
>>> +                fn try_from(#param: #input_ty) -> Result<#enum_ident, =
Self::Error> {
>>> +                    #overflow_assertion
>>> +
>>> +                    #(#clauses)* {
>>> +                        ::core::result::Result::Err(::kernel::prelude:=
:EINVAL)
>>
>> What happens if we need a different error type here? For example, a
>> quick look around in nova-core's "Chipset" enum, an unrecognized chipset
>> ID warrants ENODEV rather than EINVAL, since it's about device
>> identification.
>>
>> Not sure if it fits the design, just wondering if this flexibility would
>> be useful, but would something like an optional
>>
>>     error =3D <ERROR>
>>
>> in the
>>
>>    #[try_from(...)]
>>
>> attribute make sense? e.g.
>>
>>    #[try_from(u32, error =3D ENODEV)]
>>
>> defaulting ofcourse to EINVAL if unspecified.
>
> I believe this is indeed a desired change.
>
> Back in September, an RFC [1] using the same API (i.e., without error
> customization) was sent; I took a quick look at the time and felt
> everything was OK, but in hindsight, the need for this flexibility is
> clear.
>
> Your proposed API looks good to me. Unless there are objections, I'll
> move forward with this approach.

One problem I can see is that ultimately the error depends on the
context of the call, not the type itself.

Nova-core's `Chipset` returning `ENODEV` is a bit too opportunistic to
me - the only place where we are doing the conversion is within probe,
and that's the error that probe is expected to return. But in another
context (say, validating some user input), `EINVAL` could be the right
error to return.

There is technically only one reason for the derived `TryFrom`
implementations to fail, and that's because the passed value doesn't
exist in the enum. So really what we would ideally want here is a
conversion method returning an `Option`, like enumn's `n` [1], that we
`ok_or` into the correct error for the context.

But short of that, I guess we could also have a dedicated, single-value
error type for derived `TryFrom` implementations that we `map_err`. That
type could even have an `Into<Error>` implementation that converts it to
`EINVAL` by default, as that's going to be the most common case.

... but if we do that, that's not very different from returning `EINVAL`
and having callers `map_err` on that when they need it.

[1] https://docs.rs/enumn/latest/enumn/

Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012040.outbound.protection.outlook.com [40.107.200.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CEF28FC;
	Wed, 25 Feb 2026 01:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771981232; cv=fail; b=uOe+OftCqDqcOHxmSDIB6C23gp5PA70V8aC+d326CT/Je65Vh8rktBMmtIwUIZAxQBT/Abn00qkGtYNx2A/V031eilL9u6vx8QNCVtj1WGcfUkd/9t+j2/6bsErZ1V9n5ubVfeT1LGAABzP452Z2IbAkFRIF+UlGR+KGxtpF/Bs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771981232; c=relaxed/simple;
	bh=oYVdIt21vf+Zgxo8i0/63eBdvvWAqe1aW39vm28yrJw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=nTUplYCe7PE8FSZ6bELF+n4MLQoXArG2iBRWp4m6XBbFsZ8fIjIlRCyWd6L6oR3CmxihOE2DegABQkzYLiAp3VQrsSPtZUR0WMRAtcASBsPDyIk7j4NBFz2BS1hTZScJnWJfcKhVmD+yi2GyfhbZRKeN5lrhtaEJFQ5WRWzeg80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ie/++1Dr; arc=fail smtp.client-ip=40.107.200.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ie/++1Dr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P4jQStKSVASuL0ywsCO4Y8AE/Zp21tK/2/vLtJvoT1Qp9dpT7z/+EEYrY/5xCw1UTQ+T8dXP+90/GahTCrz0tkCP3WHsN7kvOGVxSOdJKUSiYwWeYM2ZYJXLdrcFn4T2Guzgrj4A1vnNjRjoeIBj5nqH21iExZ3X8/f9MTn7DUTrrVwGrHbEzmrp3JzHtP0skhFtAIgnviW9t27RSqmMQhCSusoBiyzC7f8PAHDTk0YZgIXGysJp0aoNMNDSt2phOJH+l7cQo0kbtPlmx8srQAEU9maB876VFhpTu6LBVATTkRdmGZT0YDoKmq5LXXQqqG1In7UgFPqQKgEr6pp85g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYVdIt21vf+Zgxo8i0/63eBdvvWAqe1aW39vm28yrJw=;
 b=fn26mAlGjTClMvhghOBFq0eC3huSAaTxgVAIv8H1PYelSCg715JSaXYwhcmUaNW67MrqDNSLzedPETiSVpPGB3w5+Drb7ygVOT+HRcOXDkPMJGAmZvWJv9l3snaWlJXJFf2zHGU9WNlNSQHdG7yJqHy2OsREpISeJI0/wI51e0zUjHlvfJYOejsPfPVMw5P1wad+jjk8FOrbfnf6Kx/JgBXgxmulLaPWMid5OFqpeQ2/nFLVYN9z233AObk1/ZSuLtQjxAfCL4rZgOZPRIfAW7wUh9AXzEMosjqG2vIAbB+OrWqKanehD+NS2xR9rZiqbkZ/DlYSqGGBYUDOCQ//GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYVdIt21vf+Zgxo8i0/63eBdvvWAqe1aW39vm28yrJw=;
 b=Ie/++1Dr6fX7QcdJruStmSMeQASKA1izyC3Ci2971PTL8oOLdD04x7BtisKxKHgiNQcJ/kOHb/e4jds4+wOw4c+AhdzAC33bHQ80McN1o/WlJ1iYpK9+ZQtCeDaIt0f+iHfWjySZeNXSwVUCOI2Lrlb08E/I+7fIgwMNrP031H+iSZXYnjM1c2+rScJmU4c6U+gaeF0umNeEIrv+IRKtd4A2QpswCbKH32VxqPGL8qq5uBfjNSJVreAUyEnMq6T9BGjKwkJ5yQeArIlks1EMBp4jMUPrcVULAtqTnMlnit++jB99G15O8Ehp8ODnR0k3gwJV1CN9KLjxZzfFxjiFlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB5631.namprd12.prod.outlook.com (2603:10b6:510:144::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Wed, 25 Feb
 2026 01:00:22 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 01:00:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Feb 2026 10:00:18 +0900
Message-Id: <DGNMX1SJGJ8W.2FS8H3B0KQ1BQ@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Alistair Popple" <apopple@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/5] gpu: nova-core: gsp: fix command queue ring
 buffer bugs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260129-nova-core-cmdq1-v3-0-2ede85493a27@nvidia.com>
 <DG7PAWIOZYWA.1S53TGBSPWGVW@nvidia.com>
In-Reply-To: <DG7PAWIOZYWA.1S53TGBSPWGVW@nvidia.com>
X-ClientProxiedBy: TYCP286CA0054.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB5631:EE_
X-MS-Office365-Filtering-Correlation-Id: ed19cd46-3aaf-4522-e768-08de7409403e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cGVPVHRxMGN6VzlROFY5cm53dDZMbWM1b1lWRnpVWUMxUmUzRldSRGhIVjVk?=
 =?utf-8?B?L2xycW1HYmFBbjhtRUNQOUN5d1JSaXBwZTVlemVsdlRoQy9ETHVmbmJSWnlB?=
 =?utf-8?B?UytEalk0Q2hzYmdVR09HN2xPeXdqTTliOWczS1lEeU9WYmllTU10TkhBSlNK?=
 =?utf-8?B?em1PZmV6WnZGZmRseWRBbmpXNGxHNExtUWwwZjlHaGZHUEdBME1iLzVaUXFT?=
 =?utf-8?B?dFJTWGNmZEVSTFltZXVsdVVlR3hGMlNPaGtKaDZSNDlrMlVoNFRNcXNHRzZK?=
 =?utf-8?B?TGZsc2pDenRwN2NVeUNqbkxacHRZd3dUOE1BbWl6dy9vNkxIM2dYZDlNb1E2?=
 =?utf-8?B?a1hqenJyUzl6YithQXRYTS9jZ3ZaMHpFcnQvano2K0IwS3prMWUwY3dhTEh1?=
 =?utf-8?B?OFYwQzRXdVZ5TGk1NVFuUkFQWU1kR1RjTTlNTDZSdnZldWw5c2Y2dFA4UWc2?=
 =?utf-8?B?TU50VkRrcU83SmdrcG44alNKY1ltamdlOGlyeThqeXgvMkwrTHVGdlcwYlU0?=
 =?utf-8?B?RkZvdmd5bnJ3T2NxWmtHZE8yeGdZcUk0cDZ6TVVlMzU0THV0M3E0R3JKMDJR?=
 =?utf-8?B?Z2MvNGNDVmV2OXVDZ0ZuZy9hWnpPMXlMZlp1amorcGZjdTk4N0txRkxjV2lY?=
 =?utf-8?B?UEg4OHNHRDFuaTZ3K3ZicjMrRkloeVJNc3lLUTR4cmxXOEgwaDdkQmk0Q0Qx?=
 =?utf-8?B?QXUwaU16TkE2WlNsR0V2OWhsbG5Cb2lxYzVNTXNRbVlBbE02ckdaR2FBMnpw?=
 =?utf-8?B?bFJhZ0QyQkxZVHUwQU04QWRieWM1NFZBZ2xYL2hrMGZMWnVGVVdxSDZLb3Zt?=
 =?utf-8?B?MjJ5S0k1cXVtL0RsMWQyL0ZTclFNS29QQ2FvdFdDNWlIZm5lb0ZDTXc5eWky?=
 =?utf-8?B?ZmZ1aEErSS9GZ1lBY00zNjVGNGNHTU91dW8zMHl4TUsyQjJOUUZpNWVwWFho?=
 =?utf-8?B?UGhPM0dzanBUcTMwY2duaU02ZTBKRldxdjFkTnFaclVjcDBQMk1kdjh1ajU4?=
 =?utf-8?B?NDJCVVhhYVZZUnJ0Ym5qK2ZQZ1FWZjFWbEFFS0hyemtHc2pITFJhMG8yWE01?=
 =?utf-8?B?d1RqV2V2L3hMZ3lBeWtDY0xnd0k0ZzVBV3QyM2M3MCtxbE1GczE2TlZIc1Y4?=
 =?utf-8?B?UU9XNkhCN240V0FjRzh4cTVvcVdyVk5XZldzSGZxM1c3cjgzdEkzKzR2NDBz?=
 =?utf-8?B?NnBrdW8vbzNRZEdRbTRpRTZJSHJLVlAwaHRuSnFSTnU3cEFNeG00Q05rMms2?=
 =?utf-8?B?L0hST0NXdUdNelJ5OTJjVGhERmZEc1lJSEI0MHhQU2VXSlNKbngvaWMxRW1t?=
 =?utf-8?B?dFIvUHpDaS9GT2lEWEI3OGgxK1JnM3gyMit1aGZMWVZaNThEWkFaM2J4Y0RS?=
 =?utf-8?B?UWhkRXlZV2RMcGZaUk1Lemp1SHlKT3hqeXVmN2l0Y0dIR3ZGM3EyRW0zN2x1?=
 =?utf-8?B?MUhFNHZEVzdmcThHU0todldIaWhLeEdvYWl4ZjAwNXFiQUIrdWJNOTJuemho?=
 =?utf-8?B?SDNBOVd0alBROGZqT0RCY3pIYTJhdFUrNFA1ei83d1FESkpLbE56and6NnNj?=
 =?utf-8?B?MW4zOFNhVnU0TFhnckVSZ3B3cGMzTVlFUDgvcVJ0N3lURTBDRHV4Wk50WFE4?=
 =?utf-8?B?dlBycHZVTG9YekthbHdmd0duTVZHdEVKKzFBTWIybjB4Z2UyRHBXS29xQzNl?=
 =?utf-8?B?TXdtZ01adVRTVlg3YUVIR3dWdVE5R3VGQW1FMktJT08yZ0lxN1NwVmRrZFky?=
 =?utf-8?B?TkNRaUFjOXJMay9Ic3RHN1dERFZOYy9kSFY0VzNxM3JSVDlDNFFta1kyak5B?=
 =?utf-8?B?bXJ2MklFSThBbHVWMW4vdEZ3SUNkbUtJQkxQZzIrRERUd3FjYkRoYUlLU05s?=
 =?utf-8?B?bEg3ZklrQVk5RUhMaWt6azBJbWRLOFlvMnliWk1jalpnb25RSXljUXNmeTJ4?=
 =?utf-8?B?dkw1SUJRaXhlZ2F1TVNscXNvcTRzSUZmRG5hK2ZvYVprT0xpSFp6YVoxTTZP?=
 =?utf-8?B?eUFBbGJkOWpXVnh6ODN5VkEvMTJFMEtWQzBpUkN4S3BLTGNsaWxFSTNrcjdO?=
 =?utf-8?B?SGVVVkVQWkVuVFlwV0tHYURHTVp5U1J1UUFNdXRlWW5yd05lT3B3Z2RFK2Vs?=
 =?utf-8?Q?TL2I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VER1Sy9aNFFzN24vaWxGSU9nVndPM0dGRHNKNWxlNkdnRTlaY3JNTFgrVjd1?=
 =?utf-8?B?UFhGcVVwRUJOL2RGend3Y2Z6UmxvK0FzMW5TN2p4ZDZVSXoyc21kdVVpN1hY?=
 =?utf-8?B?emQrd0FZWW5uaTlpR3diUHpmaHIzNG10WU9PR28xS0FjMnVYSCtMVmJhZHVs?=
 =?utf-8?B?STVua3F0cG1LNkdrOWNYWlpzZ091Tmhic21Mczk0Zi92RmlZNXRYc0grYkNG?=
 =?utf-8?B?b21YKzlPSGpaN0ZvRmdtZFNUQzVaL080ZHJmT2E4bzZobTJONnZXQ0o1MGJr?=
 =?utf-8?B?anQzdE9JQkl2bGRKZk4xdjhScWdCWTlRQTNVdEk3RTN6U1hrY0J2Q2ZPbjBp?=
 =?utf-8?B?QmJnQ2tpZndtMDY5R0tyeUYxd3kwTnluNDNscTJINzZVMUdqck9FMEJCVnl2?=
 =?utf-8?B?QXpWNGdoV0kvZGdPS2kvU3hWWlFoeTEvMkFZTFd2NEJCMmFnenlpaitIWXVr?=
 =?utf-8?B?eDFMVTdjNVFHaUNlc2YxcXA0OU12bFY3b0JCNGhlSDU1OHFDSzkwN0JKTldP?=
 =?utf-8?B?WGluemNMblJWczMxTUwwTWlTOE9IbklMQU4vZkJlRlVZQ3Fwd0RDdXNHQlp2?=
 =?utf-8?B?YWNVVlpCSXdqeEtiNlQ1b1NIRE9SSHJOUXBZVlJvajljalNDeHhuOEd5Ykpw?=
 =?utf-8?B?bS96ZUtrNTg2V0hZR2t1NEhnQ1ZxV3dJc2d4a1N3TnZjQWdKZFhOUmRONkRN?=
 =?utf-8?B?cXl4WTBwT01YOUpEMHMxM2sxaFpQRXdiN3pkMkVmanpwdDZQNjY1YmJvTXVl?=
 =?utf-8?B?UjIyQkJNNnp3UitjekR4eE1KRGJ6ekxrOXdRRGN3enhoSk4xNmtVdXI5a3hM?=
 =?utf-8?B?aTFiWW5FN3JLYWpla0YzS3hQWk9BUUdOY3dtS3ZJWWdWVVNoanozaW5CU2Mx?=
 =?utf-8?B?OEJmNGlzQ09JOUNVV25tK25wUVpEajN4UmFkUWY5eU4vSVZoeHFFZHhYQ01j?=
 =?utf-8?B?Rm4zbUhPT3YrUSs4S0cwV0FmcUtvZnpGMldjc21JU3U1eWhwNnFGQ2QzNUw4?=
 =?utf-8?B?S2ZjanpYajd4bC9SWEl4Nit4bWNJZThMTjVLR096aWN5WEZPRTBnOHpRaXRZ?=
 =?utf-8?B?SXdHTUcyMHAyMWJvc1ZZZHJHbDg0cDlQUCs4OGxRKzBhYjR6eTBJNHhwN2py?=
 =?utf-8?B?R29LbGt3MFZaN0dNZVFPTHp6L3Y1NGZmd056OGJmNEVLNWlOU0NPdkU0Q2JJ?=
 =?utf-8?B?ZmIvVDBmclRXTGZFMmtFTUJWaVQ2aWVjSVZ1VTRtd1dOWUIvTHFqQXdzVDZa?=
 =?utf-8?B?cUpTM083ZklOSC9rWm1HWXJGaTR1NFYvQUgxODdGUEV3U2JudXZiSFhYblRl?=
 =?utf-8?B?aVZFYTk2MVA5VnJ5WjRCRmVMcG9IR3BqRUxrWWFIajYraEpmbGNoQUp6TUFP?=
 =?utf-8?B?K2dVdjhoVU5tZGkxYW9Sb0xBc2REa1lLd3cwSlZpdXA2WUxpWjBML0VFNDFl?=
 =?utf-8?B?ZTdneGJxdXFWdXorVVl5TnJuV3Bia3VQQ21paXdKb1pCeTNubTlqOFFWZG9x?=
 =?utf-8?B?Uy93aDJpbFpUeDc0NlRmajJGZUljMDFLUkxmTUs1djBkVlRFOTZLNXlpdlRw?=
 =?utf-8?B?ZmQzeWRESUFqM1l0VE9xQ0drYVFHQTNhNVZoMnpCTWpEQkZKbVlCeVJtZ1Bq?=
 =?utf-8?B?dzJqRFNzL2UxWHZmRXBsSktVL1B5NlFmMG1mbFBYQmpGWUM1UlhXdDBCeTd2?=
 =?utf-8?B?Y2R2QWNZSGc2Zmx6Si9oQVVFSkFHcmxDQTBvenlyN3lnRlpyUUFZanNmMmo1?=
 =?utf-8?B?TkZuSHRlR0NkQlNyUk1uQVlkaW1wWEEvcmx0eHZzZmJEM0V2ckJJYll6alQ4?=
 =?utf-8?B?L1g0YXVkUjJUZUJrZjRLNVU4Y2NhWWJwVGppWW5MNlJzNzZMZmxGeWp5SHJE?=
 =?utf-8?B?Y0JMeHNKaW9FaEYyMUxyeTRQR0xvYldsSlNxU3ZMcGN6TThmWUFJU0pLMjRW?=
 =?utf-8?B?MGFidG5PSEo2bWFaVHlMNnNBcFNzS2phV0RycUpBdEhCN1ZEUnp4di9MZWll?=
 =?utf-8?B?RlZVK1NZTGY0SXhhVGJkQWdLTVJabXZTSTI4cDBod2xhTDdRZ1NHRFZuSEI4?=
 =?utf-8?B?em9zeEJyOXY4YU1vRmljR2tzWk91OTdwNEt6UmMybU5pWTI4TFJYOEVpbjli?=
 =?utf-8?B?SW1scTRabDJNaWt2b3owYndBdzRDaFQ0cXAxc0JiODJkckJOUnpURndmVmg5?=
 =?utf-8?B?ZkNrM3hmWXU2S2V2SXZiRzdzSWJDbXFtcXBYL1VvMk1jTUVVZjdidm9UeS84?=
 =?utf-8?B?Y2VqZ2VoSU45NlorVkVMNldvYnZDRDNVaVFZRFpxeWhsU0dBYVZacS9PTTJ5?=
 =?utf-8?B?dWFOWUhjQ2d4QWx0ZjdyVEJlWEp2V096SXRyOXpCcS9nbFBINytveW5YdHpZ?=
 =?utf-8?Q?11s/ZgxuuyZApYEZ3So9yV+vjU4odeHhVSO2BKGue/aNY?=
X-MS-Exchange-AntiSpam-MessageData-1: xaqkkJdkUErnTQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed19cd46-3aaf-4522-e768-08de7409403e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 01:00:21.8732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76P+dzjTwYPDA+OCLgKS2RAekKFvuwKxn312Xz27UgSXyS2DcDWxGN03MftncolB67s3TvKe1SeHY2SEs9UwEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5631

On Fri Feb 6, 2026 at 4:29 PM JST, Alexandre Courbot wrote:
> On Thu Jan 29, 2026 at 4:44 PM JST, Eliot Courtney wrote:
>> This series fixes a few bugs in the GSP command queue ring buffer
>> implementation in nova-core and also clarifies some of the comments.
>>
>> The ring buffer uses read and write pointers (rx/tx) to track which area=
s
>> are available for the CPU vs the GSP to read/write into.
>>
>> In the ring buffers there were some indexing issues which could end up
>> causing panics, so I fixed those and added more rigorous proofs of
>> correctness in the panic comments.
>>
>> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>
> Staged the series for pushing into `drm-rust-next` as soon as it
> reopens. Thanks for these critical fixes!

Pushed into `drm-rust-next`.

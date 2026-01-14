Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013047.outbound.protection.outlook.com [40.93.201.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0A136C0B1;
	Wed, 14 Jan 2026 07:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768377230; cv=fail; b=L0GgU8I0qGmerSiaKd4N0lgXiMuFD5GfQKcM4KC2reXCmHC0Al29UZR2NyduDw2Y6cX96y8rlXnTw3IKnRcJE2hWcmh/FcLleMgxPnt66pEnDwrpQsIafeBNTzHDPmX+sWG35opQBkr5+VZH/t4wMRvZApSABJesde7mm9GP2DU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768377230; c=relaxed/simple;
	bh=nUHlNtJ/MjxV5A9VBnhrCehKGDQmD+e6+3iIzPwKH+E=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=OZGGT3bc5tqxgkPRuzTfX3niAcm6wi44trTHcpavu2G0TS8gVdyvdqFw8Pj4CyZMu7tBtJMF8hxWXYxmjOsCH17O6kU1N4i7STWrgu1quTnZmvvaup/UQ/4Qa9Ib9xGZL9cyHQWfR9scgxr+WFwT+yZTyGzZRoloVN9h6/FYiIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I9LqQxSo; arc=fail smtp.client-ip=40.93.201.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I9LqQxSo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=egqMnFWa3AoAw0GZNdVPcKzYJrX7VtPMgs3cKaaqMW4Yl8NB9f0yxNwkciNQwgSXlyupUaEjCcIEKfO7SD2Uev9LEgzBXqL+NAZ39SMl6ISY+qOHT3KqFuq6D8uH1t2jRLfKqJIm5bVt7FTF6lNIJbx1vdGFDISpB9AX6VSWNiY0MggGGldn9Uz25BUm8ktFtEMXxKFlU5Rzll97S43x+2x0LMQWAyW6bSnK+8lI5KlRcO05u5cXzUMMfEHiMgNBEQqHfQm7QX7f1lRZdthoesbDTDeZoWkoWb/Fmvpv3raB07DI57oxkySBm3/e5AgcDQaWaytEn61DqqySjPQZWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dAAfSTk3isBjmfjh2OVKCCeMM22KCoXZ+cDAfDSAino=;
 b=bn8ix1dVMp6bdU+YPO4H8ZP7WdsCrq9ZohYTF6pxmPztTJGO+8NsNxY90waEX7RNF3/5gHCTlVDHalq4h/AD2c763XGkmTZorVmVN8G5BSJNxUpKihiNGZW8y7y5XNpFztPEdDeisrMuFfNJm3vrWgpC22DTM8K36sIILR3d1pMN+ukeszBeDiN8UPELolunQYoPMLz2P2SFy+MWW5TSkXpK1Bs+oJ0BAvZmfHbUBLrgkTYAcMgx8PMROIR5f0It0D2goUKrVT5FfIilW2vdSRLGmFV6deeWbVBLSSRynBTpZCDjOJs4Hmcc/Fr6+Dgk2dNNrnCai+cvBVJ324YpMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAAfSTk3isBjmfjh2OVKCCeMM22KCoXZ+cDAfDSAino=;
 b=I9LqQxSoxqVS0cVD3nDiNDVXa38Xu4Pw3ODFuB2n8R72XmOeOzgYbP+Um+FMQQDR55NgmBJ12JGnQykCRmqYuktvXRmyFQuc0AMrwppWSKkiGsTi41eP3B7kLHJEPUkCqImEP1+Emwzh1VRxt9b+tCwblDST3kZG0xQxjZC/LiKx+zM7J8zQ5NczlNY38PLK8krQMlJCJ0JfdG2YoBRT7faH9PClPjrw6hSpfsfvj1+zDDYWGhGkRwf+tizAxq7gfPAo8txtIV+BEyTi+k28eQQFstY9awAAihb55Jn16QgOpALcVEA3NnLKoku97xz0iqH491AVYW1m1UnXKnnNHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8978.namprd12.prod.outlook.com (2603:10b6:a03:545::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 07:53:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 07:53:41 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 16:53:37 +0900
Message-Id: <DFO5EMUQ33AP.2NM06WXNV5WH0@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] rust: Add soc_device support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Matthew Maurer" <mmaurer@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251216-soc-bindings-v3-0-42ecdc8c117e@google.com>
 <20251216-soc-bindings-v3-1-42ecdc8c117e@google.com>
 <DF050MST4PTF.DFB7FVBD25I7@nvidia.com>
 <CAGSQo0173bon2kGo5wGFXo-1x+LL1NpH376Z4GcshKaGVNLHXw@mail.gmail.com>
In-Reply-To: <CAGSQo0173bon2kGo5wGFXo-1x+LL1NpH376Z4GcshKaGVNLHXw@mail.gmail.com>
X-ClientProxiedBy: TYCPR01CA0168.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8978:EE_
X-MS-Office365-Filtering-Correlation-Id: 9440ecb5-6b73-4f32-7936-08de534208c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZVhzYnFDVDJsWUJOK0NRdG5tZmo1TWl2UW1xZm1ZaThseXo1bkR6ZURZL1VG?=
 =?utf-8?B?cGR2elZrWG1GN1JDWnpqdmViWW53eHJFdjh0S1JVa2wxMWM2b01kbUJIeUNZ?=
 =?utf-8?B?RVpQdlVOYWhDc1RQTEw4WDA3SC9IMkFrZ281S2NtMjk4Unhtb3RKbjJmTkVy?=
 =?utf-8?B?dUE3MmZ5RmgzazgyVkxweHZOOWlYTUg2ZGE2dldJeCtDM0crb2RJemRBSGd3?=
 =?utf-8?B?SlhNTUlQU3J2V29OTEliazZUeFNTU0pLQzkxell3bGN6Tm5qU2FjVEQxcU5z?=
 =?utf-8?B?WmIwaThwY3pFcWt0MTZodFdhTCsvQmlNcU5ic3pncmtFY3l5Tnh2VkJJYXRk?=
 =?utf-8?B?R0VPbHlvRWxxaUVway9DZG5nVTdVVG8reE1GejNYMUVodUtjR2JSbjIwdXo1?=
 =?utf-8?B?Mnd4aXk1NlJFb3FEdlUvajBxSWNLQmlIUXVIMVZqeCsxMndrMkVtNWllbmRu?=
 =?utf-8?B?ZWpzRmgrS2tVbFFwdWlUQkdoam9ncmxlalNCN1BLaFRmVzYvaWdTUUhYam1L?=
 =?utf-8?B?MlcrS1Jaa2VKRW5nZEVjNFl2Zk9FZkFudkFLR3cwVyswem1uVURnVnVhMTlp?=
 =?utf-8?B?ci8yRXVSL1ViQW5hbzdSamdBT3pZQUFRZ3d0U0NmRG5iVXlDTEFaV3ZSK3ZS?=
 =?utf-8?B?NUh0TVpaUGFCV1Jhd0dMbTI2WnBKWkxFU0Z6S0VqQVpscFE1c002aEYrZk9G?=
 =?utf-8?B?RStaWDJ5NGpISzZoZlB1ZFdZSzdhZEpvWXBpTW5DbDJoemlvZEZkekUwQXJa?=
 =?utf-8?B?Ymh6YTh6R3JrUytNZm5zbUhOeHlLR3o2UlFlY1hOVU9NS0NadmNNZjlKV2lK?=
 =?utf-8?B?YklSQi9Ic1lFb1loWEZQNExyZTBhSGVVdDNBVFJUVFRFOVRqV0VwQlhWMkMv?=
 =?utf-8?B?N0NIcEFrNVhmek9PQk1mbENvWkZFQTRKV0RWTzlmeHRObWVCcTdpdzhkWFdZ?=
 =?utf-8?B?S0l4MkxRbjdGejlkbGNqWElqWENqVmwrQkJIU042RjVMalErYTA3T2o0d0hx?=
 =?utf-8?B?RkhZZEZ1UGJvdVI5cFhLVmZ0RnFCaGF3MzNQbUJKcVU4elF1bVJqRWtnTzNY?=
 =?utf-8?B?YllBL1JFRTVVK3lSZGtNTG83cEljeGNxV3BISEI5MnR2ZU1Gbkw1OGRFc2hZ?=
 =?utf-8?B?OW5DeWNOeHcyTDllSWhhSkNJUXAwUnVPQi90Ujk2ajB0LytRSVp5MmNISXBQ?=
 =?utf-8?B?K2JDQVgyU2pDSCsrN3hTSG8wV2YyVmtScW4xUDdBUFFwNFk1R1lJT3FsT1o2?=
 =?utf-8?B?YXhzd0Z0Y0x0WTRnbEFpaUpRSS96U1YyZ05PczVlMCtTZnhXZlYwSXpRNjZW?=
 =?utf-8?B?T0NCVk0wcXgxWWZ4OWI0eWx0SkhrU2dGekN4UnJMWDFJV0M0dElNMG41UHl0?=
 =?utf-8?B?UHFSVWJ5TVMxTDV1RUo2K0I2Q3dzN3ZmZW0vQktDbXlaQytwQzlFL2c4SDl6?=
 =?utf-8?B?RkRMaFZtNCtPL1J2bEdXamNsVUl2RGZCbU13L0FTRDMvVG13dXJKUW9uS0Ur?=
 =?utf-8?B?RHJtNEl0NjR3ekJSYm5peGw3eWNXaGVkQ0lzUDBCWUpGdHVOeFBVSjEyMXcv?=
 =?utf-8?B?dHUyR2Urc3h1MVhFNHlPd2hXeTQ0S0dOTE5YSDBiZk1Td1lUNGJDM1B0bEQ0?=
 =?utf-8?B?VG1MaGM4bk16bUU1dm5aRW1IcGorcnBWSGJQODhOOUFGdkszSTU3eXJ2c0Q2?=
 =?utf-8?B?MjJ3VWh6REZ4WU5RaDN1L0RJMXkvazR2RFJzQ3BnSmxHaFJWeWtQZy9Md2c2?=
 =?utf-8?B?YnFYbWI0dnVadnNoTmpEOUNEdFFtTzFvbjE4ZGU5d2ZRclN1RXRTZEJTcEEw?=
 =?utf-8?B?NjJYalBnbGgrS1FmaGd0aXVSSnBNWlJzZFNpOStGR0ZsSjBYR2V3VXBpMGxh?=
 =?utf-8?B?SktoY0JiRGc4b09tcjF5ZkgxbzYyS1UvaCt4TkNKNWFoQWlYaXN6MklrNDFO?=
 =?utf-8?Q?Vm2HOGwqc+IXaN+KCq/5k5TlFLUNHO9G?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1FTMmFlaXQwaDNNOTNQd0Y2bUFYVnhGQVdFRFNTTlc2N2NYUTFOZjVLUmEr?=
 =?utf-8?B?MDQ4Q1dsWVpZb3RFU2NzSW80RG9uYnI4NGFVMFdyRjh0L1pleWtmQWxQOUM3?=
 =?utf-8?B?NVR4aXBUZkdiTGtUaFJ2b0FPQ1RNdm91bzhXajRNYmx2RmREWUVvZE1rVEg4?=
 =?utf-8?B?QlZEK1oxVFgyRmVQSWtqSHlKczJkaWJEQXdpTnVYYmZxVnc0cHI0SVBUL1FZ?=
 =?utf-8?B?U0VtY2dOc3hPbitLQm9rK0pFbHRrUFF5K3hNVUhEcE9Nbm1TL0ZDR002SlBY?=
 =?utf-8?B?VjVGUTlXeElGblNQZUV5ODRDN3NzZHZoVnM5K1IwMlpWdnYwMmJYVUQ0dmlY?=
 =?utf-8?B?TEUrUFlvQWJjbGZMQVRTVmxVRXNtb2N1YUJ2bkJVZWNTcHM2dXJhbmJMZUtk?=
 =?utf-8?B?b2NsYUZYRU5EYllSY21EeWdiNGM5QTRhR2daeUZrRFFkb2RWYmczZGJ2RU5n?=
 =?utf-8?B?a1Noa0ZKaWlFRXB4T1ZjSXJPR1luU01JejVMNmpacEx6ZHlnM3k0L0ZMdVdJ?=
 =?utf-8?B?R2VINmhrcEYra0lSbHUwSlF5Z0xESzlUTHZXV0tQN0xrbWp0bmp6bC9QM1JQ?=
 =?utf-8?B?T0ZyZnlqeEd5UDBZZnZxd29hKzZCdUszVWY4QVh1cXU4bnE4bHpFTGY5UHha?=
 =?utf-8?B?N2JlcGlISVJKN0pOVElneTRkeXdlMFRiWVZXWXlPTk9DQXhYR1F4OVR2VFhO?=
 =?utf-8?B?Wm0vS3Yyb3RCTWdkZnBXcWc3V01GYmloRXlzMXhpc1lzVmJkU0QvSlhmWTFa?=
 =?utf-8?B?anp3d0xyM3VDRmpNOW1qb2JLb1c2OGZqbzZ1SndMRUFLMEJrR2RVTzJ2UXRN?=
 =?utf-8?B?b1ZNZXdGVFBGOTUzanFNM0RWelEyM0JVU21DT1YyeUJkYmY5T0VISWQzMisv?=
 =?utf-8?B?R1M0RVhVL2k2dDl3Y2dVZ0tna1JZT2hqWUhqS2tydDVHb0h5aEpEd0pMRm53?=
 =?utf-8?B?WHBIbHd6aFZUWG91VCt4MEhzVUg1bHRkeStxYXhrYVJOWXJLVXNNTXVOS3Zt?=
 =?utf-8?B?czh0Z2wxc0x2bjI2a0pMT2h1cE9teTFaNGVWa3VOM0pqQlh0aHNGYVBPSjlx?=
 =?utf-8?B?dS80OHo2amhIazVQN29meWM2ZDNqelhyb2pWem9FYzhTc2lEVy9ORlBWb2t2?=
 =?utf-8?B?RStqZnp2SlFCdSthRmh6a3p0V3VyOHhmRjNMa3NpQmRRTGJwY1pvRFdpS2cz?=
 =?utf-8?B?clozS2szcmcrTjJtcUQwMDRZNjdOU3VTbnZvdkRWVks2T1Z2bEZiTEoxSXRB?=
 =?utf-8?B?QUdwd3dnRU5kQXZOUzJYeG5BZUFSRDJHUnRDZHJ1UTAxQ0dVS0F2MytCK2hJ?=
 =?utf-8?B?ZlZYK1hXaXlTT1pOei9pbjlRQTRIZWlBZWd3UVkrdlRaVTY5b2xQejY4ajZY?=
 =?utf-8?B?U2pvNUgwYXV6Z3owdU55UXZXN3UvbHF2OGZnbldlL1cyRmlpUm8rZnFHcjda?=
 =?utf-8?B?ZVZXUXcvcExxMVdhQnNqK1hUVDBUZFBRMlpqR1RwWTI5TFpvczd2VmhNMkds?=
 =?utf-8?B?VElodHE3bW04S0txVFMwU3FJcGpUZTcvOCtCVzU0c1BGSUdFaCtLU1JpN2lJ?=
 =?utf-8?B?ZXpIN0xzMU1FVWVPaG53ZVJvcnJSNlNyTjFKdnJwUzAzNXFOQmszci9UcXF1?=
 =?utf-8?B?UzBsaTZvY1NqaTNEUUVJcldxMVpxR1duVGh6VVdVOVV3OVRRMnQrZ2pSRE1w?=
 =?utf-8?B?QWtQT3FHM0FlRGNDS3RVUHp5L0tTOXRqekpjZGttdnZTdmh5V3krKzRWejBm?=
 =?utf-8?B?UFBMeG5hMVJsSERkOUE3KzJkdkwyV2NhZVlMeVJGR1BaU1QwczY2aEU5U28x?=
 =?utf-8?B?MzRwc2VBbGo4N2p3YUtOK1NlcHg3L0xqNm9wSjVnazEvNkQvWC92NklVYWw2?=
 =?utf-8?B?ZlFJM1U2M2J2WWtQK0ZQbVVnaG1vY01vMHRlUFVqVldmRjMxOEV2MFFFU0x1?=
 =?utf-8?B?eloxSHdVWG9KSDA0S1lHNFVUVWsvcDdkSi9Kb0Juc1hBaXNsSlB5WEwzYkpm?=
 =?utf-8?B?YWh3TnZlSVFkelRWK1gydXRDVjJoVnBVNmg5cCs1RG5iOCtUbk9zVWtYWU52?=
 =?utf-8?B?d283c3AyOVNPWDFJMi9ZUGh5alg1YkJxQS9ja1dCMkJualAyQ08zZDNjb3BJ?=
 =?utf-8?B?aHJ3WEo1NG1YNHljbFhBMGxwRWpYaDZkYmppRmhwOVA0b1NCOFNvOGk1cG4r?=
 =?utf-8?B?OEI5TnNXd3ovMnVOTzA0c09qYmg4cDRRTVVuakdkOTEzZVlOcTV2VUUwR29L?=
 =?utf-8?B?RnFEUSsyMy96ZEFyaVZndm5hMDBJTFN4QmE5V0ViQXRMSFdXVmNlRW1IVVRR?=
 =?utf-8?B?UFJEY0lRUWVsRkRKSDJJaGlYb1kwRU5vNjNGTkczTCtVcWsvMTVwSUxXSE1L?=
 =?utf-8?Q?3i9SKhpj8htSMVUR3HFxwEzl4bXXdr+h8VDDfD0XCy/rC?=
X-MS-Exchange-AntiSpam-MessageData-1: lnLEQVXFec7APw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9440ecb5-6b73-4f32-7936-08de534208c5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 07:53:41.6530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rf1aVqNRO00J6VXhU5UNo6o7WV6Uvz0oSiXN8n/JQfwwYPYeUvbJVEhcJimkBG609BPjTybVYfUMAr/oG1IJfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8978

On Sat Dec 27, 2025 at 4:26 AM JST, Matthew Maurer wrote:
> On Tue, Dec 16, 2025 at 6:31=E2=80=AFPM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>> On Wed Dec 17, 2025 at 4:24 AM JST, Matthew Maurer wrote:
>> > Allow SoC drivers in Rust to present metadata about their devices to
>> > userspace through /sys/devices/socX and other drivers to identify thei=
r
>> > properties through `soc_device_match`.
>> >
>> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
>> > ---
>> >  MAINTAINERS                     |   1 +
>> >  rust/bindings/bindings_helper.h |   1 +
>> >  rust/kernel/lib.rs              |   2 +
>> >  rust/kernel/soc.rs              | 135 +++++++++++++++++++++++++++++++=
+++++++++
>> >  4 files changed, 139 insertions(+)
>> >
>> > diff --git a/MAINTAINERS b/MAINTAINERS
>> > index c5a7cda26c600e49c7ab0d547306d3281333f672..4ff01fb0f1bda270020941=
13c0bf9d074d28fdb6 100644
>> > --- a/MAINTAINERS
>> > +++ b/MAINTAINERS
>> > @@ -7700,6 +7700,7 @@ F:      rust/kernel/devres.rs
>> >  F:   rust/kernel/driver.rs
>> >  F:   rust/kernel/faux.rs
>> >  F:   rust/kernel/platform.rs
>> > +F:   rust/kernel/soc.rs
>> >  F:   samples/rust/rust_debugfs.rs
>> >  F:   samples/rust/rust_debugfs_scoped.rs
>> >  F:   samples/rust/rust_driver_platform.rs
>> > diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_=
helper.h
>> > index a067038b4b422b4256f4a2b75fe644d47e6e82c8..9fdf76ca630e00715503e2=
a3a809bedc895697fd 100644
>> > --- a/rust/bindings/bindings_helper.h
>> > +++ b/rust/bindings/bindings_helper.h
>> > @@ -80,6 +80,7 @@
>> >  #include <linux/sched.h>
>> >  #include <linux/security.h>
>> >  #include <linux/slab.h>
>> > +#include <linux/sys_soc.h>
>> >  #include <linux/task_work.h>
>> >  #include <linux/tracepoint.h>
>> >  #include <linux/usb.h>
>> > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> > index f812cf12004286962985a068665443dc22c389a2..6d637e2fed1b605e2dfc2e=
7b2247179439a90ba9 100644
>> > --- a/rust/kernel/lib.rs
>> > +++ b/rust/kernel/lib.rs
>> > @@ -138,6 +138,8 @@
>> >  pub mod seq_file;
>> >  pub mod sizes;
>> >  pub mod slice;
>> > +#[cfg(CONFIG_SOC_BUS)]
>> > +pub mod soc;
>> >  mod static_assert;
>> >  #[doc(hidden)]
>> >  pub mod std_vendor;
>> > diff --git a/rust/kernel/soc.rs b/rust/kernel/soc.rs
>> > new file mode 100644
>> > index 0000000000000000000000000000000000000000..0d6a36c83cb67ef20dc1e3=
d3995752f36e25ac9f
>> > --- /dev/null
>> > +++ b/rust/kernel/soc.rs
>> > @@ -0,0 +1,135 @@
>> > +// SPDX-License-Identifier: GPL-2.0
>> > +
>> > +// Copyright (C) 2025 Google LLC.
>> > +
>> > +//! SoC Driver Abstraction.
>> > +//!
>> > +//! C header: [`include/linux/sys_soc.h`](srctree/include/linux/sys_s=
oc.h)
>> > +
>> > +use crate::{
>> > +    bindings,
>> > +    error,
>> > +    prelude::*,
>> > +    str::CString,
>> > +    types::Opaque, //
>> > +};
>> > +use core::ptr::NonNull;
>> > +
>> > +/// Attributes for a SoC device.
>> > +///
>> > +/// These are both exported to userspace under /sys/devices/socX and =
provided to other drivers to
>> > +/// match against via `soc_device_match` (not yet available in Rust) =
to enable quirks or
>> > +/// device-specific support where necessary.
>> > +///
>> > +/// All fields are freeform - they have no specific formatting, just =
defined meanings.
>> > +/// For example, the [`machine`](`Attributes::machine`) field could b=
e "DB8500" or
>> > +/// "Qualcomm Technologies, Inc. SM8560 HDK", but regardless it shoul=
d identify a board or product.
>> > +pub struct Attributes {
>> > +    /// Should generally be a board ID or product ID. Examples
>> > +    /// include DB8500 (ST-Ericsson) or "Qualcomm Technologies, inc. =
SM8560 HDK".
>> > +    ///
>> > +    /// If this field is not populated, the SoC infrastructure will t=
ry to populate it from
>> > +    /// `/model` in the device tree.
>> > +    pub machine: Option<CString>,
>> > +    /// The broader class this SoC belongs to. Examples include ux500
>> > +    /// (for DB8500) or Snapdragon (for SM8650).
>>
>> Formatting of the comments seems a bit off (also appears in other
>> places, please reapply formatting globally to be sure).
>
> I have just re-run the `rustfmt` target on this commit, and see no
> changes. Is there something specific that you think is off?

rustfmt doesn't touch comments IIUC.

What I had in mind was for instance that the first line of the comment
for `machine` is shorter than it could be, i.e. the comments should be
re-wrapped for consistency.

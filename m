Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012040.outbound.protection.outlook.com [52.101.53.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA9A39E6D8;
	Tue, 24 Feb 2026 14:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771942941; cv=fail; b=IHYdYnKJYTOlqgq/VULweVg1ozVOi14Rv0SdjeWeucIfYhvkN21EivYZIq87+LVr/51z2Xf1Pa1f5dqiyTt23xZMjpiGmisxnHx/9NWRezBkjxvGrQynujvYR5X3U0Okc0VC7Gbo9nmRDGZez4NYPLLebd0yr8Rho+6lLllAsdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771942941; c=relaxed/simple;
	bh=TcC/0HgSiNIqEHyMERhzbunfuxnhABk0R6879fRIrvE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rTxAsf+R6ah2IpyT28XlQLmDreAAxKWbSRtzxwdz/I+3pKQ9NudCl+QuAezXzzeYSjvcr44+ZSFL360s7U9h/a42X90Vdf17PS1A4K94WRVhZGvxJzTi9/n3mqwWAfLOqcchCikTnI0ZhM66KlmhDdmDPXkrrSLDa1PXvbM14y0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=auhB+gjl; arc=fail smtp.client-ip=52.101.53.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="auhB+gjl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOJwIgf57jiH8Oks9WaMq0MwaIYtq3RW3qli6PxAdLxLBTWvV2MRNHaFZhN4eZ6sbOwATgHpuNkbqjZEhTiP8gUSvQODfo3rXdlmzlgmo/8GVNSsRj+Er/GTmxFgZ8DIXex8zkKcFNWQVyXLlQC0kW978sX3x4kktWnEm++U2DWVKHRAtPYiB+w0RrynHmhs3xyF3BitPCXgDpwvU/S+MrkZEuuF2+Lz+YSJYMMwTlq/GhHK8MFZKB9ZgRPuJ0NMytrrKUj8w2UY56soOivdJ727EKVFc/FA7r0Ip7AMUsAZ1mGmjbVazANyjwfMTpNiNZiX6O0AlrQ4f/T3v4EkbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSznYsY1ajD8r+TxMVK8h1CuRPjgUYV87ErETI4erGs=;
 b=llaRG+o3rCOizHW2+vnySCvZGnvSqgu4c1G7yA1c8QtYS5kD8bPGm1wWXoMevVPFezub2a6+2blpeIAPpPj0RBZ078vKHBDHw90bf3jcht2SoDfUgTse0z32nW2/TlVPu2bIT1nhg59bGe9lvtusaSNhuLSRnpgLmaBIKCKFQdKUU1zdL6AhoGjU/eQzxt4YD4+tI65rzgWovWzMvUPowXAXDecEyq68U3gqs95PvH1zx1CDoWlkYBWyIqEv/FPmtm0IAKdWqkqt5jhPDF2u19sF6JQmVCW647ahmr70pSbq1Js0IIrZCtUccWrR10TKm21U1oz9rkElb5WsmGz0SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSznYsY1ajD8r+TxMVK8h1CuRPjgUYV87ErETI4erGs=;
 b=auhB+gjlJroOT9BxpTN9pFUfv48UvSukxCGDT+Eu1WsanG+8Q7CUV7epNbHogwGKuK4UiFFkpAAIVF2bsF9CvVKngH0ixOtEnP80v4/h7FrZIVan+4q/lAZIb6JcycG/G9uAu6vjkakcn4qJozSA3s4DJCcfdkDbmj4fig/pB/EhmUJJtuaayB4NXSLX1yhZYZvtlTV1Hf/L+tElCU8WiM3tcI9nwQhpGNzGAA7v8YVDbNH7ORQNocKB9+P+sD+FD0ofYOEq459k2UAq+8av0qgb/RdEQqSE+cHul+ln5jaRFf8RqNR0r81SyJxVQRkGroFd9QGNukkOmSefpBKQAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7811.namprd12.prod.outlook.com (2603:10b6:806:34f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 14:22:15 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 14:22:15 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 24 Feb 2026 23:21:40 +0900
Subject: [PATCH v7 02/10] rust: num: add `shr` and `shl` methods to
 `Bounded`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-register-v7-2-aad44f760f33@nvidia.com>
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
In-Reply-To: <20260224-register-v7-0-aad44f760f33@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0007.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: 276eda58-30ce-48bd-f3b1-08de73b01bd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1RCTjNXNGt6eGdKeEJRVUxtaS9uaFgzSnMwUVRrUEdtUmxrbS9hdUJ4bG9L?=
 =?utf-8?B?ZElPcUcxa1FSM0w0ejNYUlJTTTNyREQ5TXBvVVI0Y0txMUQvMTdVNkNNaUQz?=
 =?utf-8?B?TStkRlRYclBlM0NNVEkrcEFxQnlTY2NLbk85MDdCc3FTNWJrSTROS0N1UXhC?=
 =?utf-8?B?U0kyOXVQSGliK3V2dzZITU1rdVJTUGhIUHRVOGxSMURYZmRFSlNFUEV3VjJH?=
 =?utf-8?B?Qm9TY1kwbStMSTVoYm5YdXdUWjRxWmpaeDV0cUFEbGpHcTd4Wkh4MUFmMjNq?=
 =?utf-8?B?dGtFa1VEZ0g2ZlZoYkk3dTZESWFqZFlzZmkyUlJYYU4vNTR5V2VoVTQ4aTJ2?=
 =?utf-8?B?Sko0ZVBJN3hZUmlWYXF5TGpWZTVMVmIzVUxPUUI2dS9sNERkblBxVHMxNTUz?=
 =?utf-8?B?SkNYc0NWdVYxc3hUVUlyaGNnNVdpSlNSdlZaQTk0UC96MWtISUN1aGRkYWhQ?=
 =?utf-8?B?WWZUVGZyN3BoNE1ueDdqV1N5Qlk4T3dKenJvZWI5anA2cEdScklNa3o1L1B2?=
 =?utf-8?B?NEtLbzViemdVZEp2b0I4ckx0KzVqUkpjZmNLclhIS0IrcTBKaWVNNmZYSVZ1?=
 =?utf-8?B?cElVNENnUUpSWm50SHNzZjVqalpoR0NHUk1DZjIzd0ZmcjFNczBNVUVjRzVL?=
 =?utf-8?B?VDBYRDRzdG9RYjFIZWtiTGc0WVFFWUFwalFzcStpRTYrazYyaG5xelZFTkt1?=
 =?utf-8?B?ajVwTFRIbDJwcTIyaFlHVUhlenpocnNycnp3SFp5QjFMb0NuNGdKWURsakxo?=
 =?utf-8?B?NWp2M0NjRWMzMWpGSVRmdnA2N3pIQUZOU0taQVFIK1NITjAzSVdtbk9Jc3Yw?=
 =?utf-8?B?MnFpTUtTSnY3QU5aR1d2YXNKaGdDVklmeW9ZdXBpWHNLTHo4YUNHOHFPcGlh?=
 =?utf-8?B?ME1uQm5YR1BDTXNPVm8vUE16L1RhUTBKTjFTaUZ5L0NmejZVSE5CN01FYXV0?=
 =?utf-8?B?ZzJqOHNxRHJlTWZNd1I3UmVjTStmcDBObXhPUVYvWlFKZkNKVFhzUWVuTmpt?=
 =?utf-8?B?MzlyaXA4dzZmMFVNQTFRTzArQmF5anh2QkZuR3lnaG1aYmlQaXYxckk2RC8v?=
 =?utf-8?B?dkFhMVg3SEswdHh4RWFqekZtRTBVUldUTGZHN1RRQmVHVmhCZTYwNXRhSlpl?=
 =?utf-8?B?cUJLY3ovbUgwTXIzUHRDbm5FbGZ2cUphd3JnNlRGMDlmOGlyeFBPS1F4NEpN?=
 =?utf-8?B?L2lEdWVVWWQzeHRGcHFoalBWa0g1WjR2alhZNFhMbVFCenlzNXlTOXNpbmRp?=
 =?utf-8?B?UzdYbnFBQ2hvMEZucHBkNEFkK0k3OSs4dUw3K0xnV0lNWUY3RW9nbVdaOHNG?=
 =?utf-8?B?MG5TMkhQR29CekVUMnR6SlMzVU1YNW1xVTJ0L2d6Z2ZVVlIzeW8zVVYzQS9n?=
 =?utf-8?B?WW5VZlUwNjUwdHJ0Y1JUckFGcVd0OUFHbXZhQkJQQlRUSU1GS1FSSHBoZjd5?=
 =?utf-8?B?WVNYVUJFWGUvQTV6dmFOOTk3dEdUN2d5Z2MvbEFzWUo1bDA4TXRrcUlGdmNi?=
 =?utf-8?B?cjNjZElYVHg0STRCZk1McWx2a3RoLzkvQWtPckVzWDBrZ2hnalpZSGFNSkVB?=
 =?utf-8?B?TDJCZnhtNS93QTRqalN0SEVIZVdyMGhmU01qczB2V2tOSUpaOUNFSXdJZVZo?=
 =?utf-8?B?T0dFZEJPcTFLdlRRM2FhNkpzT2FGaTRLTStWRjF2MS9kTVhPZjBFZzBJTkJL?=
 =?utf-8?B?YWlqdnh1NGFQSEpRUkU2dmdESGY3dGxYWXJ5SngyUGk1Ukk5VVNBU3pVcTVk?=
 =?utf-8?B?eU0yTmFUZGI0L3dITTlHV0lIQ09ScC9seFQwQ0djZUFaaG1CRitKck1TeDJQ?=
 =?utf-8?B?NVAzMEtyU0hLRkswMndUZjA2RXBXWG1TQytnRER1K0szQVl1Q000dm4rVjh4?=
 =?utf-8?B?QlF4bW5BYUFadzVFN0pBVjF3QzBrS3hzbGlHS0d3NzRCUGFxbUlndWkvRStY?=
 =?utf-8?B?U3N6dnlULytHQWJubU9zM0kvdkVWK3R6c2w1RTM3bEVPZEx2MVZjd2tmWUxC?=
 =?utf-8?B?Vi9hQ2NlUmtSaXUyWTdsMlg0eDJxVVMrZFJmSjFML3lwZVJWTU5FNXI2ZE5C?=
 =?utf-8?B?dmdpayszL2V4SnI0QTA3ME8vdUJzR0RSZ2JJU2poM1ZiL2xlTjI1U2dSSG1Q?=
 =?utf-8?B?UXQrWFQ0cHFWajBMQkJlcHhjWW5qRzltQS93NEpydzQ4eXdGNnJzUkhqODhp?=
 =?utf-8?B?emc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWxOS0d0NUJneG9lY0o0U0FYNmVXRjlmazYybU5NYTdsNnM4aTg1NUFoM2hl?=
 =?utf-8?B?TTVmTWlEU2J5QW1sUlFBaHh4dFlZT3p1OXBzdVVHbUNHSGNWUmQ5WmhSYlU2?=
 =?utf-8?B?Ynd5ZTJTTkw5SUlUYnpyM3FOYTExRU1RNitBUWNOWUlEZHJUQ0VzaWl1bS92?=
 =?utf-8?B?Q1hIMDJvRGo0eW1ydTgrVUZhdnhudkp0UFk0NDZqVTdwRGRoaEN5V2haOTdm?=
 =?utf-8?B?eTcrK0s4SEtUMWtrM29CbHNTcXVoOVE2WWFuMUR3amR1ZzVvYzZvSDdHaVM5?=
 =?utf-8?B?T1lueHZnVTVXUitVbm9RQUU1NURyM2VLZ1QrMFdXaGtyOCtmQU94TXdFMVJZ?=
 =?utf-8?B?VHFwdldGenlDZHp5aUNDSVBva3d6RWlMVXYvMStrc0lpSWlpMy9vZDhyUFpD?=
 =?utf-8?B?QXFXSHJ6UVhDRFdBUDZhS29HU2tpcm45Qks4Y2hiVStCaFhZdTgyU2ZwTFBS?=
 =?utf-8?B?S3U2Z2FVQ1J0L1A0cDdoT001SDA4Rk42bU9DWDFkaVdIazYzSnVwUWFNY0Fv?=
 =?utf-8?B?Wm5WWFExb3lzZHBPenRPVVVYZ2lUdnh6WmRqdEdIb0JkTXZjTGpsSDhUZmEv?=
 =?utf-8?B?L1hjNFZydVgyb2JQYVpKajBseVZGdzIrZC8xTGV4OVdraUFkOWc0OFZIaEIv?=
 =?utf-8?B?Vy94OTg2S2taekV3OXNkNW1yaTlJd0Jjcm9IUkdaVloxOUovNTR6dC9ERXI5?=
 =?utf-8?B?VFdnY1RvcDYzWE9yTTlUdFVjaStNYlloWXJ6MWNoNTA2TktwRDNVQzk1STBZ?=
 =?utf-8?B?YklPSFNhZFh6N1kzRVI3dEE4dHVhbENOY1dEMXAzTThQQ0NZdHAwUlhJNFA0?=
 =?utf-8?B?b0JqSkNnMEZJQ09WTTJiQkNGUXBlSW01cG16dFQ0UUs2NGttdTNhdzFHSHBH?=
 =?utf-8?B?aE5Gc3ZUZzl3cERFNThJOWh2REZ6UDRMUisyem5VR3FEc08zaXFvZHJEYUxx?=
 =?utf-8?B?dFlmVk9DNnk1ZjVDRnJjem1zSjY4UUxiczI0cmtqQ0Q2SjNxdGM2bVQ3b0VR?=
 =?utf-8?B?anpFa2NobG5rRWVIQzREM1dhamliRy9TK2piQ2R5bTRQUVFPVnVKanE2NFJR?=
 =?utf-8?B?cFo3NFlqeFh2MHYyb3pZVGdrcWRpYXV2MzBlcHAycmN2L2MwcjBhaXVxUEVa?=
 =?utf-8?B?aVhmQmJNMXpobStFaEtNVXdxQm9lZWovVFRlMU9ESjlpa1JTVFUwWEVxNmJO?=
 =?utf-8?B?QWZyQW85bjA1cXhSdmhvRE5CTURUNGdwVDJTTE5iY280TUhrdFZjcmJVRVNC?=
 =?utf-8?B?T3Jzc2NLakJrNDQwbGN2VGxXV0daeE1mS1A3NlZWWG9CQVlvdEtlNVNtQXBq?=
 =?utf-8?B?cDB1WktwcnZZOVEyOTBTRTYzQ3pPVUpMSG5vRG5Qak5UdXBjeUI2NUM1Smlq?=
 =?utf-8?B?SHJQL0VHcmJiZ0FsdnFYeDlVNmQvbW1SellKenpRZlZKajBLZSt2MG5ST3Ri?=
 =?utf-8?B?M0ZKZjdqOUFNeThtSG5VcEMzUE0rWEtSbmFoQXUxa2ZVVzlCUU9OMmVRbXhT?=
 =?utf-8?B?c1N4c2RRVFVoVlRyRThDcnFXZE04emVEdzZJekhrL1NQU3V1bUk3MGhVV0VF?=
 =?utf-8?B?VHpOdlZReUEyd0xzS1B3T2llTm9oUDRLSWdkK05SUEVldFRGWjBxbEFaeDZI?=
 =?utf-8?B?bmN0TUtYMTFrSDdES2NZQWxyRUVxd2MvdjhDMDc0Q1NqWEFybTR4M1JqQklY?=
 =?utf-8?B?b2tyM1V5UnRReGpWZWozeUVWaFVJYzBoMnlLbVdWMUZ5VFJjeGx4eDlhVHI3?=
 =?utf-8?B?akZPMzhrTTI5cXFGREVabFdpSFZVYVlLVkJJY21ZYXNqUERlMjJPaWp1emlQ?=
 =?utf-8?B?RFhyRTlhQWhUQUVwcERMTENERHhucmtOcnhHdXlqS0hjWGEwNytwOUppdW82?=
 =?utf-8?B?aWhDem9sdXpMSnowQ0VqNldLRkh1TFF4bGw1Qlh6WXBMdDBjRHV6dW14ZGZl?=
 =?utf-8?B?NmFrVEJWZVI5d0Y2M1lNSnpyUkxTQ2M1Rm5ZelFHcGhWdUhBeXpMVHNJZG9m?=
 =?utf-8?B?b0xSekhXK3NLSk1GUldGbzVqN2hDLzZZMm1DY0NjWVBrSTU3dmx5ZXRmVHN2?=
 =?utf-8?B?VGt1S0VOV3F3TDFtMXhteGFaUUxiQXVTa1JuVmg5bEpsb3R2UENiWk95Tmti?=
 =?utf-8?B?RlB6ZU5HeWhCY0Y4V2MzenhGb3ZlVlRpSGhoMmp6d2Y1MnZVaWlKYmFxd3NY?=
 =?utf-8?B?V2hxdUZzTnpldFZ4ZGpZbkxNdnYxbWR4SUliYzR2OWkvOHV6RXZZUC92ZFpO?=
 =?utf-8?B?UGFJU051Yy8rK2dMQ3huSDNmY290VmZtNHZxM1FuMnFCeFY4RGxOSmZlUWox?=
 =?utf-8?B?RVFHeVFvMXZSSFAvbE1XcmNGZEN2Ry9WSU1wZjhENndUMi9XODR2NUwxc3Qv?=
 =?utf-8?Q?rZYBvDAbxPKBK7ccUgXPPD+wFKjNTDKIkh9/xSnQzWCsh?=
X-MS-Exchange-AntiSpam-MessageData-1: d+sN7y3uCUfwFw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 276eda58-30ce-48bd-f3b1-08de73b01bd0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 14:22:15.5660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLVqdtCMOwR8boN7UzonJkRxfiID1FjweXGRlEeYvR5PJagTVj11NpJFSpemmvJ7Ae6kBr5Ez0ETunBiQ4nXMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7811

Shifting a `Bounded` left or right changes the number of bits required
to represent the value. Add methods that perform the shift and return a
`Bounded` with the appropriately adjusted bit width.

These methods are particularly useful for bitfield extraction.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/num/bounded.rs | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index fa81acbdc8c2..2f5f13ecd3d6 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -473,6 +473,48 @@ pub fn cast<U>(self) -> Bounded<U, N>
         // `N` bits, and with the same signedness.
         unsafe { Bounded::__new(value) }
     }
+
+    /// Right-shifts `self` by `SHIFT` and returns the result as a `Bounded<_, RES>`, where `RES >=
+    /// N - SHIFT`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::Bounded;
+    ///
+    /// let v = Bounded::<u32, 16>::new::<0xff00>();
+    /// let v_shifted: Bounded::<u32, 8> = v.shr::<8, _>();
+    ///
+    /// assert_eq!(v_shifted.get(), 0xff);
+    /// ```
+    pub fn shr<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
+        const { assert!(RES + SHIFT >= N) }
+
+        // SAFETY: We shift the value right by `SHIFT`, reducing the number of bits needed to
+        // represent the shifted value by as much, and just asserted that `RES >= N - SHIFT`.
+        unsafe { Bounded::__new(self.0 >> SHIFT) }
+    }
+
+    /// Left-shifts `self` by `SHIFT` and returns the result as a `Bounded<_, RES>`, where `RES >=
+    /// N + SHIFT`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::Bounded;
+    ///
+    /// let v = Bounded::<u32, 8>::new::<0xff>();
+    /// let v_shifted: Bounded::<u32, 16> = v.shl::<8, _>();
+    ///
+    /// assert_eq!(v_shifted.get(), 0xff00);
+    /// ```
+    pub fn shl<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
+        const { assert!(RES >= N + SHIFT) }
+
+        // SAFETY: We shift the value left by `SHIFT`, augmenting the number of bits needed to
+        // represent the shifted value by as much, and just asserted that `RES >= N + SHIFT`.
+        unsafe { Bounded::__new(self.0 << SHIFT) }
+    }
 }
 
 impl<T, const N: u32> Deref for Bounded<T, N>

-- 
2.53.0


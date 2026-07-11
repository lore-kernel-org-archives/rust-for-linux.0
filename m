Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011042.outbound.protection.outlook.com [52.101.52.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB07F3C1093;
	Sat, 11 Jul 2026 12:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783773599; cv=fail; b=CsN8nPlwhbgHnIPn89dKO2rRZT0luSMtcAUFUWWsHiY70alZEKuK390JNTZsCZ+8w0nmmLuPo4VsTfDGaTWRx757BL6EasNvvEM24RGSd9pzikGqHDpFaj29L1Yu/g0qy7CbKmOX0yXV/Pjtbf6BFWqCorvHkJRaax/1UTewGH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783773599; c=relaxed/simple;
	bh=6PLM1dZNq/OPEkcC5lyyb3ql7bNQF3mFTn8bc68cx5Q=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=JH4H8jZJrqXMEy2Tzs2fGhuGLfxhvuxZxsiRwO5qDlpKPn0GzhzD6GtpodhfCdtVfiidd4m2sSe02HFB9DaPsOqIulrWGlNBHn38teiqhV3gEywofLASd9UYdy7439i0o/CKkBTPHeb6FhXU+F5QmCf2Qp1LPSo8qYyGukF/H6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PqMAlfue; arc=fail smtp.client-ip=52.101.52.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PqMAlfue"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJtqK5MP4q9mAfTuHGS/kZueRZcDWEv0Z/Cz7B+S6LKrNQd5xkT/rMrouHKlqtwIeeTPNS3wEgU9mN8phnXd3ZsILU9sZzCwB8L4w1aE7saPJ/A0GUodec+uMPPjGT8gOsoBKmf9yOTlE7GwNP3n6mr5Ifky6RCEsxSzd+7habVmL6hdG4VWJ002Z6M5NJQ4G7XL44QmgDNZSaHtG3qkSkFzTq1vpnfI6ZOsbjOe7PgHI/zsKleP44/EeFlRXxAlBbKrQvTqxjgf42kJf6vu0vjSfhtEHTwUjkOJkEgHCsFzEdBF+rQJ8TzPr5ivr32uE4g7cSfRL3qU1DUX6MnjRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6PLM1dZNq/OPEkcC5lyyb3ql7bNQF3mFTn8bc68cx5Q=;
 b=XzBOBpk/RyGYdS09VxT5tnPyv7MuoCbkQros+oznVrXIhPWVU5p7hleop6Zkt6+DQcBxUS913ARAftJwZSMbUV73c0mkdIgU8zXgV7RXbDxljxReZ3SZP/qyhQd5t19Ad24KkhhX15lwei/vKACXWI6Xm1KaOWamRGtY6w+xXc+poqtFJKuFruU3JRVlgM6yoMpWbcO37IubstTzimRmRK8WKfgf0+T9gY2vkuBUEz6HS50eoVFqoG0dW5k+IMCMF5HHzwAXcVStzqwaGQE2avvT86RaWsJEM3EQiEzmyOeCZIHE1ks+AgFHOWP632Cx1fYK4qQ8zsazHYdUxs2DXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6PLM1dZNq/OPEkcC5lyyb3ql7bNQF3mFTn8bc68cx5Q=;
 b=PqMAlfueEQ41dUXBXVZesbHmX66XFQrpyLXL6L2bSS3zW8mWlTyDG15i6a3c4YN2I588xk+ZvvGvsNbfucppoFBttKJz+AJtg+AwRxm+MIhbgtvhbPOZzP+02pgAxWp84S48Z7wSBgmnnSU/Lj0sQIob/HDij0BB6HS4b/jvA7hlbLoVdrlFbcN95TloVGqG/58BvEpYvYviZzGUxE2Q4wI6zg84zlrIkqKamULUL20/qP1KfX2LQF0zMJW+biOEDIT03rV5Mfjg2ectfR79sOBllO+G1bbMgim7U0n5ETGmxaPTxRr5JQ8KwMiOZ+t8N5XMm+M6lEcGFp9VYbke9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB5625.namprd12.prod.outlook.com (2603:10b6:303:168::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Sat, 11 Jul
 2026 12:39:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0181.016; Sat, 11 Jul 2026
 12:39:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 11 Jul 2026 21:39:43 +0900
Message-Id: <DJVQYNNZ215D.32MMLSYRLRGUI@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Kosumi Chan" <chankocyo@gmail.com>
Cc: <ojeda@kernel.org>, <boqun@kernel.org>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <tamird@kernel.org>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rust: impl_flags: use bit helper in example
References: <20260711082327.3062227-1-chankocyo@gmail.com>
In-Reply-To: <20260711082327.3062227-1-chankocyo@gmail.com>
X-ClientProxiedBy: TYCPR01CA0162.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB5625:EE_
X-MS-Office365-Filtering-Correlation-Id: 92810756-36d0-4e3c-a991-08dedf4980e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|10070799003|1800799024|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	da2z6/axhRh9vZ7szgWPsXuPEbKIuKH/2kzhu6FjmxtkJKCnxSZHo8m32DOxUrQvC4BRWulWujN8Gq6XSSfjLd3pCCkyvlNSUWZCeTDWF5WMSaOl+1HEa46JpT5KILmDg8VHZP/18TWhZrtlPwaqczFZZLAH4WEXlH6X3kVpm3DeE/suREGkHXiAsjzUrUB+FfAOZq86TkCcQnC+MQ/8KzxnvvVaeRYvLt8AyPqcCJcENIRnPlS8jykEi4OsP2cA1VaqZeJPGmdKSulLi70EuY8OwSN64ioxNUbHCXOAQU0xWxRlQvzOU9GUMZi8Vf8SwDd5hZyja3f+CBWiPQtyKscsnZ+kvVEglnUU0Q64ngjqQOatWLElR0FCfQj7ecyiedLz/CayEq7rgitYgu2wFqy8d4l0SNA2ecjAosLr1PUpna6TV7NPDaE5pJBO1c3qvApjiNRuJQVLCu6VNToTttfSjV319TMmkC7A1e47rN3yMIfA1G/q/z6XjrPWk06FtrhSzECzBmnDCD8R/RK+oZgEWOWv+AsKlnOfXre+dIJznp1aMgRz0BkzCSZyXlrvgNlUbGcrpj6mRY8B2+fezvKEg09lKqjQH3+xnBqzPBqzvgwL0zvKwTwAGIptzORZzJMlBIlWKfG4UqgSz5hHEz/sCWwZYyXsAzVsBdXi5yo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(10070799003)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzJxUUg4R0hzSWFTZ0tkYzJHeXNTNnYyR3hJY2FNL2hUK3ZiUVhEbGNSVE81?=
 =?utf-8?B?RVE5dmpkUVNtUFBCMjFQZ0JYVHZQcEZrR3F4NktXMzg1T2d2WS9LRisyNkVk?=
 =?utf-8?B?ZHZFc1l5NC93a3RFcysxUnlPdG9McWpIQm41blV6RFpRSit3SzB0UmVudDEw?=
 =?utf-8?B?ZGkxRGh4N3dBOHVsdmNLNXQwOFFJeWZvQ1YzNFJrZTAzSXU0dDlwaDJiT2hD?=
 =?utf-8?B?WjZFM1hHUnE4SVNtWnc4T01iSEFEblJWSkF5UmpDcUNkdlJZZWltcko5Z0RJ?=
 =?utf-8?B?SVVuczNTQkYvdVAyTXJZNDQzTmtQaTJDWlhYVER6bVF2MFFXNWM5RFVTUU5p?=
 =?utf-8?B?QkZjZ2FwQ1RVbTN1RDBKbGh0VnQvK3pGbzlYcWxKR2ZjblljeFd0ODFJMDRq?=
 =?utf-8?B?eVBWNXMveXpVUmcwdk9UK3ZFeEhIcEREakJtWE1hL3paNEFaRGN0bitpNjkw?=
 =?utf-8?B?b2V0alcvT0E3WFBJSWdzSzFpYUFFdVJQSUE4VWM2ZFh3VTFDMG9QbEdoOUJs?=
 =?utf-8?B?YXlWOHVSeXJaaElWbjFDaTd4TnFMaG1EdUNSQTQrbzgyNlVJbmtWUkc5c3R1?=
 =?utf-8?B?WFdrRGNlYmFkamtqdlhERWpIMVo0dHR0UXpJeTVvZTZhK2x4K3hMdndvSjl1?=
 =?utf-8?B?ODE0RWRPTWVUS2d3Mi8yY1lBTmMrSkl4R2FCNUN0dzVWcnVFVFgrbWdOK3hI?=
 =?utf-8?B?ZEZWSWxocno5cjRQRU45VHRVdWZkazhZV3I5R09LZ05UNzVPdVZSUHZKV01L?=
 =?utf-8?B?Nm5HYk9wZTBtbnJheG9GYXJtbWh3elhEazEzeXVkUGhaRGZ4Mk5ERWkwVXg0?=
 =?utf-8?B?UHoxbHhheXFiSXJHK1BYMTF0MzFSUmQ0elExTExqbnpXWHpEL0xwRC9MV2Zu?=
 =?utf-8?B?eVhSZmVjMFFkQXJ6REVpN2x0SlZHZXZEMnpwZ3J3SHV4VHpaOG9XdVUrc0c2?=
 =?utf-8?B?bmlKYTEyNVVjVTNVMGZqekpIaDRnQS8yMlVNUWN1T25GT3l3YmwyV2hzTDhG?=
 =?utf-8?B?WVIrQWZnZGVuK1VoN3dVLzBESWI4RCtneWFxTldwQVNjb28yNUFnRVYveHZt?=
 =?utf-8?B?NkVTMXAySEVrRWlxdS9MSlRBWXVLT0tnM0dtWkxLRFUyK0RkclRzMlVwcTJ0?=
 =?utf-8?B?VWNxcjdyTStxckdhWFN0SnExV21mV3BIRERiMmgyYjNrQ3k0NmdqcmRHTENT?=
 =?utf-8?B?WEExcXdlNVgrNkVqQndpOVdUSnhyOVlOUzJ2VFNSazNvNWxNUWZhUUpkZEdH?=
 =?utf-8?B?bDE2R0ZxdGlLejEyYW5wTDU3Rml3R1R1dU1BMzJMSjRWQXlXWHlqNWpoNHZh?=
 =?utf-8?B?S1RKZm5wRW1JTllmVm9WcmgxOUV3NTcrSWF2S1NTcVZOZ0xCQ29TemFQcEZv?=
 =?utf-8?B?NnFISDRRWXFOWnFxNEdGbXlFc2R5RSsvQnNrSmhOaCtiSGNCaUllUnZPTEZu?=
 =?utf-8?B?ZmQrVDB1WnVVcTdxcEo2dUpxVDFGcVlaSnR3N21zR0xyR2JLUVpvUHF3T3Jm?=
 =?utf-8?B?R3FncXRYNFoyZ0x6Um5CejVKVnB3dXRGVU5nUXh5MGluUXRwNUVpeENyRVBQ?=
 =?utf-8?B?cGcvN05UWmpubFNRckNNRzB1akVmUmpQU2lqK3M2TGV6ZEFDSzh6dldzWEFU?=
 =?utf-8?B?MUtKekg0L01HTEFsSnNwQ2hFWkdmNGcrQWlzVkJjb2NyZ2VtMHNtb3RIMkY5?=
 =?utf-8?B?ZThkejArNzZBQy84K3BWTGpEblFqZDJCaGFnd0MzdVhhbmR3VWc4M1JkVUdk?=
 =?utf-8?B?OG01YjJBSWMxeFZlbHFPWS94bVU0MTBHZXNrVzJ1clAwbXJLWlp1NGFmZEl0?=
 =?utf-8?B?UmZUaVA1eUZPMDE3T0o5dzRNQm0xTHlhTncySUp5TDRIa01XTmZTZXU1WHQ3?=
 =?utf-8?B?M0RhOUJ1dFRTRit6d3g2N1Mzd0tXb0FwWGRuNm5aNjA4MklQMlNoQ0FiWVU1?=
 =?utf-8?B?d2JPYXdtbGJGNjB1a2ZidU5FOGdlNUk4d0FPbnZqYUlJcGY1dlpXWHBxQ2xx?=
 =?utf-8?B?ZlBWa2JVTXJkUm01b1BPY2g4bEU4bVlIYjV4cXJYQXh2N0FvTExlNEV5ZHFW?=
 =?utf-8?B?OEtvYk9qOUF0czFGbmNEcnlBdTdTR3VkejZJcmpmeU9oWXBxSDZReGNqd2ND?=
 =?utf-8?B?QWhHYnRXYTdXN0FnY3pPeVk3Sk5zS0VBRFVYUm5VMWhlMldCYm5zQTFlZ0k1?=
 =?utf-8?B?TzE5bmg0UUtoOS95QjFnaitTUmpQSVFGMDlsUHVuQkY2dE5kRXpoRGRKMmln?=
 =?utf-8?B?d3FrcytVRlZON1RMTnNVZHBFZjh6WlhzcCt5QnlreEo2b2pHcHRpVjlDSGVJ?=
 =?utf-8?B?T09QV3o0L2VDOTFNcW5NZ0hsUWpOaWljRjhNOTF2NlVFakhOU2gzQTA3MlVI?=
 =?utf-8?Q?Yd76HDM2k3UqSNh/YvjRp3kLPR0pApz3uvcGOixNLFgmM?=
X-MS-Exchange-AntiSpam-MessageData-1: iaSB2WYHYLjReA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92810756-36d0-4e3c-a991-08dedf4980e2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2026 12:39:52.3421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zAPNGLL+OUYODV91SRsstyNrH32h4vJ+srs6Ezt5T813rbrNfUoAEKPaeQSQxvKL1aPXlT/HPWag+60jHbKX8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5625

On Sat Jul 11, 2026 at 5:23 PM JST, Kosumi Chan wrote:
> Use bit_u32() instead of open-coding shifts in the impl_flags! example.
> This demonstrates the checked bit helper and ensures that bit positions
> remain within the underlying u32 type.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1244
> Assisted-by: OpenCode:openai/gpt-5.6-sol
> Signed-off-by: Kosumi Chan <chankocyo@gmail.com>

Why not. :)

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

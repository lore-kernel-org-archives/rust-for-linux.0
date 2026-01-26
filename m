Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021086.outbound.protection.outlook.com [52.101.95.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E95D338925;
	Mon, 26 Jan 2026 13:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769433944; cv=fail; b=VG+IuE9+FgTz8Mu6yLDGijltb8/PObJ0rwyF9qWw5QZ4BrgXmPO5bOpu10qNTOPBA3Xw7ShMcPBdCBgJSiLdkdHBdkTNXacPyArbbBeBVSDovABvaoWHkieYerXxUuqJenRc4ua1s/2f1a27svt/l+MmQ1gAWNRhXDnXHYcDhOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769433944; c=relaxed/simple;
	bh=paHHXRM/lkaL71ltsjWoZaA4GvkKLmM+C8lJAB2PMJs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=jcO9N5L1IK2uGkpjTsKTEEIG0BZLSk0zYvM4SfngmS8m5o2bgOXzDO9qBjTUeSwiVL6RRQoZBKG84Uu02nWoY+OlNxXBDuMEOcjtZ9bct3DCPzrFLOVpWweIZ8uSZhRG6vcQgMIngWb0pKCySY4OFis8Ge4ATelDffnu5MOEygo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=r99b19ds; arc=fail smtp.client-ip=52.101.95.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="r99b19ds"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gxz1sBbCafbA4o0o5zbnkTWQpbxksz/Z2PHC2KN70kUPTzDzAvZFDMckE4WYuGNiOEYt9QZVbNeLaHx7JY0gbY8f3On2bhDUMeVVjb4dGthO21W8KhOle/FkpmknPvF3ppGt3o6bwXLeCZfgr92EXMGhxkG/AcFWXq2QLaqX+zUxU2OOXIaH1fqLoTPWi5ereLjBxbS9vI/bxJRcHpsWetweoRTeqeL5yAV+qtuzYRbIYsz9Fon4RWT1LYYdRTD47XA5sp6rs56GL4WeK9tiXCekIqN0Ya6kO5vznGv7DBNrKD8zcrrlYADX7ExCLXZrhA88P8Xdhc22MYz39VvU7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/yTDMZOgdFeaJi1kQd6pxu2Wh0U9rwzXpbQHB7LQfU=;
 b=hvXetK4BgwXLXOof83vyTujpmVPfeZK6X75fC3BknoZN6EgKn8hzSmxys1uljynElTLKyGAi5/52UbIjjLDEPJT/Taui58RinfUHFlBUQERdrkwNpRZveiexW0qpq2lYxkfxJ0NqHGFDFmqCMqazPf59vhOGa2XjiAyDzI4dtIaUbLTa8oSR8bhVDxsIyYQvcHsyztnKnDHR5ZQiaNz7OcsbaDGPu7sTYiV/PPkFuaATntXWKsfhSapv085fXaySrsuX1y51obc5JleCB2McpC71/MbyjcyUSsiTWjXFM0YBXBPvSKqrBdYX1c23rJ3xtHSYZrFe+KPs+l/TPY20Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/yTDMZOgdFeaJi1kQd6pxu2Wh0U9rwzXpbQHB7LQfU=;
 b=r99b19dsAUxd2s8xp2P7+B/RM57XDvJitS/6CM7I+unneSZ9VDI3PYm21uEq2D7kp+wSQpJeJtu1LOSLJBH+yndnZR1EEDRD+q39MOlO6wTDfqNanhQf7/cJIWtX3huSwwfQtCC1F7OWYdApU6CkaUn516Gd9w0zlAqgRfNtZAU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB2958.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:17e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Mon, 26 Jan
 2026 13:25:39 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 13:25:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 13:25:38 +0000
Message-Id: <DFYJZDN05OFW.1PY3UJS1PJBYG@garyguo.net>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Will Deacon" <will@kernel.org>, "Waiman Long" <longman@redhat.com>
Subject: Re: [PATCH v17 08/16] rust: helper: Add
 spin_{un,}lock_irq_{enable,disable}() helpers
From: "Gary Guo" <gary@garyguo.net>
To: "Lyude Paul" <lyude@redhat.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>
X-Mailer: aerc 0.21.0
References: <20260121223933.1568682-1-lyude@redhat.com>
 <20260121223933.1568682-9-lyude@redhat.com>
In-Reply-To: <20260121223933.1568682-9-lyude@redhat.com>
X-ClientProxiedBy: LO4P123CA0024.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::11) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB2958:EE_
X-MS-Office365-Filtering-Correlation-Id: 155dd20d-17bf-4b45-4fb7-08de5cde6599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFBSQVpnUGRSMFRpRGxYTHE4QytYcWxqelJTY0hTb09QZ2Zmc2psaENsZ3U0?=
 =?utf-8?B?Vm1wd3cxeDVyOFVVU0J5ZDFERDFvVEViZENqaGptTFZrUFRxczd1cXdsMWU1?=
 =?utf-8?B?T1FiMFBmNmxxcnRaS3dRcERodEZBSXQ3YkVoVE9EM2cxbTVpM3RadEZqdll4?=
 =?utf-8?B?b1hqQ284TnA1eGhUV0VpVm5XUmFuVG8yYU5wenVKUDRIMzFtWkg2T3cvYWVw?=
 =?utf-8?B?VDg4d2VLdXhGS2lxc0FZNi9CeFlMN3ZxRGpKKzZSdnQ5ZlE1TVZ1c1ZHZnZL?=
 =?utf-8?B?dm9idk1rbzA3akY2WGU2djlPb1U4TG9pK1dWb1JCN3pGcFU1MFJSUVJFdGRH?=
 =?utf-8?B?QVNZcFpqUk5pclpPSWhEaEFMQm8reHVRSG9FbkFaNWRRaDN5dmFMNUprRWlS?=
 =?utf-8?B?aUJzc045WHRVRUVyS0xXT1VEUjdCL01obGxjRlNLaFZhNUZndU0vOTRUU0pB?=
 =?utf-8?B?VXFvTnhhZ2x4L3FVdTFrbWV2RHREQTA2eVA2elhTKzQxTnpiSmFtTEUzSG4y?=
 =?utf-8?B?UVh6NHZQMEIvWWl6RTdUMXNsNmoyZGhDWnlERDJOdXc3Y1lXVWREam1JOVQv?=
 =?utf-8?B?N0M0Lzc3VmxxLzJEOTF0aGQ3emRJcFFUUlliODFzcnpBbFFCMzRhcU9ERXQw?=
 =?utf-8?B?bFZQOXBOZkJaU3ladks3b3BBNFlHTmpTOWdja0ZJZVVlQmRBZE1PV0xsVDJG?=
 =?utf-8?B?Qi93QnRJbjhLWGpreEpXdGpkd3F3NXVta2syNjFOdXZjZHdwTWpqZmdzQVpt?=
 =?utf-8?B?WTU0d2hZZnJrMDJSR2pKd3g0K0tHNFhQNnhNSGh4ZlpBdms4RENJc2RINjNR?=
 =?utf-8?B?K2dhTmhuT3FvOWhRSjBoR1ZtVXhOdTJkSFppdlVrTXFMUGxud3JNRkhYNmVC?=
 =?utf-8?B?czdzb3JiNHhiNmtRMmRFKzFXQ3hsc01iWkVIcEtaRGt5SHpDMzltSTlLczVN?=
 =?utf-8?B?SGNWWHArRWRJMkVCZ01LQndndWNzZWZja1FDY1Z2RldiRGliUW1HTXFteGth?=
 =?utf-8?B?MGwyUFB2WFJSMHIvaUFmODJ3N0lpR21EY1N6NTREOS9FWnd5TmYzMER5NmpC?=
 =?utf-8?B?WkpwTkVFMHd1NHJSRXZsVmpVOHRJemxNbkNhdFJjVEZoLzRUYTI2ZXd6T2VN?=
 =?utf-8?B?NkhVNXhGT2VueDg3eVcyYXF6cllUVG82K2Z6YUk2RXFEZFZsNWM3dkZMTUx1?=
 =?utf-8?B?V3hTNi9vN1FpNWpCRW9hNlR6OWVUOTUvN21Wb0FsN3A0RThOWXpCU3RkaUpF?=
 =?utf-8?B?Zm54cEx4TmZabE5ITDdSc3NnSlQ5Ym1QRjJMZ1dHeFd6TUdmejlGaFdOSkZO?=
 =?utf-8?B?K1hnWWFoNE5HMmVBUG1Ic0ErOXZWRVNFdWJCSGtQMXA2UGRzb1RROFc5eGZ1?=
 =?utf-8?B?QVJINW9qR2p4d0dKcVRDSDFiT2wxS21xazc1a3lYSnlnbU01Y1J6eW5yMTFH?=
 =?utf-8?B?d2k3QzJPelViK21HSXpWZnNWd0E4SFUzck90cmZGNlNySSszbHcvU3d4WjBP?=
 =?utf-8?B?Q3VESkhtOVMzYlRnSG0zd1p6UjE5Nnk4V053UlFzRWdrSmtuVlNXeTRIU1NP?=
 =?utf-8?B?bWw5SklLVVU5Rkk1ZlZ1aVRtMEgveXcwOCtOMEM5Z0piTzlHQ2dIaU1uY2M1?=
 =?utf-8?B?ZjVraHVyc1EyVlRIQzVPQkxtSUFxSXErb1N4M01UbWhvZ0p2czNhSWhMemF5?=
 =?utf-8?B?NWtDZHhQSGtGYVdjRVAwM1B4OFdYc1pCdko5KzJoYlM2ZVp4eGFzQTExODZ1?=
 =?utf-8?B?L0tWcG5PMExZa1dWYXhncXJtUktPUEJ4UUk1cHVaTm1BOTAva1NtMmFWc0ZP?=
 =?utf-8?B?MStUYUpwRnVDM2ZWamo2NmcrN0VBZk9LaVRIRnR5V01hT3hjcFhWWFY0d01s?=
 =?utf-8?B?MkdPM21mZEVxRXJoNUVINnB1UGVReW9zRnZjR3NYNmZBNU42blhzVWtjKzJs?=
 =?utf-8?B?T3h4TU05UmQrdW5UZ0NRRUMwL2NXUTR1bTdhOUMyQVJwSE1GWG1CZXBPVzdw?=
 =?utf-8?B?cU51VmF2NVFkRUZLVGNnRldCS1RoV2tlS3RSdnhna1gvOEplV3dKWWtKWnUv?=
 =?utf-8?B?WDlmYjJhVEZrd25IUEI0U1ZRYTBLOElBbnBocjdsUnhyL0NTeWhZUWc0Rk1k?=
 =?utf-8?Q?ruZE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REE5alBSUjlxN3p4akpZaFJsSkx5aVh0V1FyM3YyOHl3WTBCZjZkMUR3ekVN?=
 =?utf-8?B?ekthSXd5QUl3Ni9OUmZ4ZTErMGZBWktLeUFHT2xuMk1JeTNjQ3d3Q3dVbVlu?=
 =?utf-8?B?bVRYN2x4S0ZLQXVxdEFUT0djRDJxV2FFZmIvMDhERGJGUzgxM0pxUHVFZFJ1?=
 =?utf-8?B?ZzFma29ZWDM1dlg1c0p3NTYrSFpLYWFydXRIdVpoZXVZTjZyY2JHQzlSVEQr?=
 =?utf-8?B?ekJFQmJDRHptYkJseHFHNFUxOGZkMTZDaDEybmdtL2piQUlFMExjRWRWdExz?=
 =?utf-8?B?MFNKS0VTd2l5YW4yRTk2czdTTDZTK05Pck9JMFY2WHlBdktFY2FlZmlHNWVC?=
 =?utf-8?B?ejJFS1RuaDRKSlc3cktDbVNPWThpejNRK1pTNWk5OE1ncHIxU2wrYTF0VWxK?=
 =?utf-8?B?U3dFT09KRTdCTStObzVYS3hDcFNGNnUycWluYnNRa2VFaU9XV1JQR0U3OE5m?=
 =?utf-8?B?UHowVFRnQzcyMG1KcHNiUk93bGJXMjhoYytYUFJlaUVtYXVHMDhvT0FGRGxX?=
 =?utf-8?B?TjRlSnNOYlIrZGkrdml0bFNUUG85cVk3U3UzVnZZZ3dKMXprRmFDNEtMdHlp?=
 =?utf-8?B?NjM5RDVwTWN2cVBoS1M0QjFEN3czMTBSbzJNdDc4Z1I5THhwUnpoWGxGN2pF?=
 =?utf-8?B?OXJha3JESzBkbWpwZGlVbktDSUY4T1N3cjFNczJGemRKVFJnZmxheHpDR09a?=
 =?utf-8?B?TUZtbXZZRmhmSnlzZVZBcjVxaHRJdXlMSzlyQ0lYSGVOTkh4Y1Zwc0pSNVBq?=
 =?utf-8?B?QU80Sjdsd0FBRmpDOUpQUHFNYjlGMTNMNlpWZnhGQk5EUDVOdnZBcFA3ZWJL?=
 =?utf-8?B?VmtVRDlWcnNacnd0MDNmWExzUlZUcGJlTmVPQ09ncHk1SWRBN0YzNHk5V2c2?=
 =?utf-8?B?M0Z1ZU8zZXhTeGVOaGpXU3FtL1YxS0xrNXZpNEozMm5YZkdaU05GdEl0OWta?=
 =?utf-8?B?UDBPS3J6LzdBRXgzcENMUGpFZmk5ZGtmNlliTjZDeVlXdS9KaFhHYzBaY2tD?=
 =?utf-8?B?QXkvRG5VSTMvaTFlTjB4WFoxL3c3aUk5K0dJalQxWmd5Ynp2VEJHSVRHeTV5?=
 =?utf-8?B?QnJoME1JdU1jdEo0cERSRCtTU2ZTYTRkTmlxNjIzRWNvVmkreHRETGlvbk1p?=
 =?utf-8?B?M0VuRUw5YzBvVE9MNTVpQVVsR1hLM203aHhDL3dmbUg3YS85eUVsRWFTak0z?=
 =?utf-8?B?ZEFneTFIekhyMHRUeUpRL05uU0U5NmwwVHVzU1V6aVNYaVFTempjbHNvalJR?=
 =?utf-8?B?RUtkc2doN2h6d2Qxc1JVMGgyZ3VkRTFtYXN2YUY1V0dLaVlYRzFsYzNNL2hW?=
 =?utf-8?B?VXJ1RU10Vnp3YzBLU2wzOTFNZmNyalg3QjJSN01zeDFxb0lRNlhQNlBTR290?=
 =?utf-8?B?SjZPNmR3RXZVSEloSFVOMFp5ZXZIS1dXTHZBbkYzSVB5a0RVR2R4UDhCVmpB?=
 =?utf-8?B?bFd1RlFFeEYvdTVtWE9TZVlsejEzOGFNUGZsVjJqMTB3UlZqSmhUZ21ZbFZZ?=
 =?utf-8?B?NXc0QTJFc1ltSkJsalhyMk43RENpUGVYZ2JYM3oxNDhmWFRGaWFZalRlODJT?=
 =?utf-8?B?eDdrQzlnRFdBM1FzOGo4YmtzNDVOQmw1cjdXSzVBRTNpaDNrV2s4cXllcUg4?=
 =?utf-8?B?N2NpeGliSzlVSTM0dVNkL2dDdGZWOHc5N1RBQ3BMV0ZxeGZzdExWUDZmL0xB?=
 =?utf-8?B?bUxtblgxVjdKSmhCd3ZBTDM0ekdYZ1V4N29pSmhXSUFEcVZxY051Rkg0NXVx?=
 =?utf-8?B?RDQxV1R5WExtRjI0T2VkU2JYVGZNQ2ZMMkZYZExkdFlVT01MalJXUXNLZm8r?=
 =?utf-8?B?Y2NTSThma1V1cVFSUWIvOUt2a2YwRnE3T0xGU3Zwc0JBTlZuRWdvMDFudCt3?=
 =?utf-8?B?bTlrZU1GMnNyVU9INW9xZTFTbE5hanl0S2RpdHYrd2tReGFFeHJud1czQ2Mr?=
 =?utf-8?B?djNEc3RtWjFXSVNYU3pVSVRjVEtBMkVDTFlqM3g5Mk1ISDdLeExuZ2pxMFMr?=
 =?utf-8?B?REZXOTRUZ1N6K2hhTFgvRHNzUHYzb2M4VyttSzlHSVd0bm1KTS9MN0FBdnBE?=
 =?utf-8?B?YnVhS0NCU1NaM1FlUENxY0tSc1liUE9uZ1VmNXM1WW1ieURoKzFIYlJ5ZGdo?=
 =?utf-8?B?eFcvMnBMcGovazlUYUtXM3AvYkQ2ZVYrQVJjakJNalZ1aFd1VStNRlNkbGpk?=
 =?utf-8?B?MFNDb2xENU8rbFBHUDVQOVV1S2tOUjhXZWxNL1ZFK1k4aDQ3L21tczRZMTZH?=
 =?utf-8?B?M2htY2JGKzQyYU5hRzZEQmdNSS9qRzFxK2oxcDVPUk9oWmwwTUpvN01YNW8x?=
 =?utf-8?Q?Sri1VfKLM+Tin+qsYK?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 155dd20d-17bf-4b45-4fb7-08de5cde6599
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:25:39.0888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2atu7zl3qZ17IsYkHS97VOItMmziQmYq/zfT1xHDAZjkxLaeCWutFsYFfEzJaWsbVkULLzFYTQFoSDwWJeorg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2958

On Wed Jan 21, 2026 at 10:39 PM GMT, Lyude Paul wrote:
> From: Boqun Feng <boqun.feng@gmail.com>
>
> spin_lock_irq_disable() and spin_unlock_irq_enable() are inline
> functions, to use them in Rust, helpers are introduced. This is for
> interrupt disabling lock abstraction in Rust.
>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/helpers/spinlock.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/rust/helpers/spinlock.c b/rust/helpers/spinlock.c
> index 42c4bf01a23e4..d4e61057c2a7a 100644
> --- a/rust/helpers/spinlock.c
> +++ b/rust/helpers/spinlock.c
> @@ -35,3 +35,18 @@ void rust_helper_spin_assert_is_held(spinlock_t *lock)
>  {
>  	lockdep_assert_held(lock);
>  }
> +
> +void rust_helper_spin_lock_irq_disable(spinlock_t *lock)
> +{
> +	spin_lock_irq_disable(lock);
> +}
> +
> +void rust_helper_spin_unlock_irq_enable(spinlock_t *lock)
> +{
> +	spin_unlock_irq_enable(lock);
> +}
> +
> +int rust_helper_spin_trylock_irq_disable(spinlock_t *lock)
> +{
> +	return spin_trylock_irq_disable(lock);
> +}

My comments from v16 about adding __rust_helper is not addressed.

Best,
Gary

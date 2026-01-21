Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013016.outbound.protection.outlook.com [40.93.201.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E9D3469E6;
	Wed, 21 Jan 2026 06:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768978576; cv=fail; b=QXECJJqt1QWHJHPKJVAyELD90D5Y1n2WGr7deKTOF9DiVmgC5MAruMr4SiYhHPGF9To7CMO5IKhlfUPpC/vYY5SWgHCdhfnEQhVShDX2AEs2f5D9oXBwLcchkfaC1GEfQt/Ur+C6+mS9htJbhQeUtzLjwX3Qnu2Jho6o/hY9h+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768978576; c=relaxed/simple;
	bh=QVv4jzfSSg+1kxVyToI18UlTePg7PIIeess3Btnlf3M=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=OCugoiD+Vzx6yIYtqbGOe28LDVLAZFRKV17KRUksx9T8hs6+AnPRX2DJoob47wryhqTRo7fUVMW8IQqxYjLHM238/2KOBeItqtCOAAomW50JPgL328IBD4ogifxGpIwVRAl7DkvnjyVxEo8Cq1XoxTTeHMsB5IeRELBfI3sTbEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BvVm3xsK; arc=fail smtp.client-ip=40.93.201.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BvVm3xsK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wx4Oqo/4s6T6CUqRoqFZhQei9PyMGleebhxiMUj6PxAGX0CMjaxJX3GFLPODvxmah2Sw9fmVHOv291LZPMUMU0dUKeTl5SRDg3e33zzDorfoeAwmEI0548fcQgz9OG0jKNg0H9PFY66hQhE8wb2aYtAAl3cYCj89YtrjqE168qmkPPvelk4rFyuXdnOXD6gKRCr6ESa4Z38Leqc71ZsRacyv9+KG10Urdt9phjzm524pLJA6Nx8wqn26QFioiRR0RJc+Mmb0QRBloiK7Nmtn1QI9yqqelgiKO6GfDY7oKZh84zvsz6MrVF9qfp4Hs1jI0vpW1EngFh3B3sCc1sfbgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVv4jzfSSg+1kxVyToI18UlTePg7PIIeess3Btnlf3M=;
 b=M8Ujry6IgitanowDpE0F0Pn/mIhFDs1orfpNEeX8MNpdi38Y36xUtSApbLXde+ub67Vy7KJsZoHbLD6sMX0BfL6ugm8YxSOa7zIETp/DGKxAjWjdPM4s9v1uQ0BtZ+kEt/nzm9iAiv9q9pRD61MGUuzMVPbMliJ8b1TXncbcTPMPKMefV4mqaGoAycU0CJbJPQc9tfLW1o2A2h+tbYbIQpnIMF7X4dGt9WITOK/CAo19bJbSROA+IhOSKDfKgBkyg3SCTxqN2R6MIh9VLhINqv+u8iVrmheZTwBm39ixV/XC4rDB9CJl4FekROZi9xI7/k2yv4ab1W6VtjH/LC99kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVv4jzfSSg+1kxVyToI18UlTePg7PIIeess3Btnlf3M=;
 b=BvVm3xsK6zIcXhYwLDxClv746JDY2Rq2U+LAcMXIkJ3SNnZ2tpN0w5eQtqIa/NVKhCWUaAElXL+DKrtXZEK1/7+/eaTxJHIZ/NOWb2Z3GCdoJQwtAPs752do4tcsgL46eNMhWieNKzV+q19infO/nnZIYlvHuGzILwNKIKARC75pQK1MKwJfJFdK5QZOOZYa1SgXQECFkh9bKtXey/bb75/+YmRPtDPHJWWQNWW2L+Q8bEpJ8w0G7R2oXkXuf7wOxo1j8SKNK6QJGe6MT2kBmDToBB4/nWwqZd2HrehB2kZWuv4Z8wVrAV+9saPqp+578V5g4cDCfylrU+zJJiYMWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL1PR12MB5994.namprd12.prod.outlook.com (2603:10b6:208:39a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 06:56:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 06:56:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 15:55:59 +0900
Message-Id: <DFU2KB960L91.5F5B0ITP7Q9L@nvidia.com>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Dirk Behme"
 <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/6] rust: add `bitfield!` and `register!` macros
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Yury Norov" <ynorov@nvidia.com>
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
 <CANiq72n9tSMFW1KHsLBLM-q47+4f7yM70CVFNVeg_3Q8i3RTvw@mail.gmail.com>
 <DFTGHU40Q7GS.2YXW1OUFRM2ML@kernel.org>
 <CANiq72=PWw6MW8NiHtFPmQ5C8xjzVJf2OOpVP2YQbsFqrB4XMA@mail.gmail.com>
 <DFTHCJYQHUHD.24MJ2SUFZDLTJ@kernel.org>
 <CANiq72m2tU-Zuv_MjLdjfK0qjE45YnuMmTTtrbzmrQ3=84ei=Q@mail.gmail.com>
 <DFTITPLFU1HB.3VCKBVLW2VCPI@kernel.org>
 <CANiq72ny=huNUmM7_1XjFyXZ_zvTFiAGwx4UB_dOxSaUx5VwOg@mail.gmail.com>
 <DFTOMX7KEFXK.3A9467KZ5GGAG@kernel.org>
 <CANiq72nRJzBm0KuGwoUV2kOk_t3VLy7FP+H2m16VAQVKAp1j1w@mail.gmail.com>
 <aXBq1TUBKWHVmg8S@yury>
In-Reply-To: <aXBq1TUBKWHVmg8S@yury>
X-ClientProxiedBy: TYCP286CA0260.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::18) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL1PR12MB5994:EE_
X-MS-Office365-Filtering-Correlation-Id: 366a09f7-1f4d-4ba1-b494-08de58ba252a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1RqaE8rRUhVVTYvNGJzZVpndnN1V0oydHVMOGJieVppa0hCcitVTWlROVF3?=
 =?utf-8?B?T1gwc294dnE0dGthRDNwUjhjTzVVaUVTdGJ5N3NRREx1elFQNmUrdTB1Njh2?=
 =?utf-8?B?UHhZOTduMDhmTEZVVW5vQWprR2IyVDFHY0hoZUNBN1pvTmRVYndGUmw3bG9G?=
 =?utf-8?B?dENPTEVhRFQvekJMK2NwdmRqaFVBQmJURGU3dG9JRk1NTUtkUGFWZDhZQllk?=
 =?utf-8?B?L29wT0kzWmwwR2U2SlJFQVVWR3Q1aHA5UWlqWDdhL3E3T2JxeXZxbndUZWR1?=
 =?utf-8?B?SkZqMy9IUDVLK1g1S3hVVDR5SG14OXBtYzliL1U5SVRKc0RpbkUvaU5uaUhq?=
 =?utf-8?B?NFBjeUVaUzZsTjNCZnlMY0Z0L1V2K2M4ckk0QnByN3d4MUNWSUtJdng5VTBO?=
 =?utf-8?B?czN6TG8rY1BSSWNEcW5NakhxOHJDZXBmTi82VXNxeWNpRVh4L3lodFlHRVpT?=
 =?utf-8?B?MTl3SklLUzRZaGRrS3pTM0N3UW5aTlNwYlVJdURHVWwyV2hyeHdFeEdaZE02?=
 =?utf-8?B?TmMxVmpMVEN4ZmlCNEpTbFBVV3VqT3FRV0JnVTFVVUg4TmJzRkc1MG0yWlV6?=
 =?utf-8?B?YU1RMVc2eWw0RWlDS2JycHZVei9kNm8rRk9odnVpazlYcTl4SEJxSUNnanBr?=
 =?utf-8?B?QjdtUVBVNUptTWNSV2lRQWpJc2J2ajhZV0p3WkpWNFBoOTBmOWJGMWIyNDBL?=
 =?utf-8?B?dXF1eTAvQXRQRllrVFVUQ3ppN3Q1N2lOd1VsQlZLUG1zc0FCYkRPY0NwR3p0?=
 =?utf-8?B?NkdwbWRzOFJscmdNNFlvc3BXeEF3c2R2ZUdjZUlmamJrL3JaejZDanNMWWNY?=
 =?utf-8?B?bXhxb0FMbzRTSmVDTmdRMGFqWE4yZ2NNQy91d0xwcDRwbmFCRTNDNHZLbmhF?=
 =?utf-8?B?VU9XWVhlaXBHTnFHd1RER2d4VmJVYllRMjFWMFJmRVdmblcvQ21vcGhBckpP?=
 =?utf-8?B?V1grNnk3TWdaMW16MGtDNmg4R2VsaGVXWUlpcnVGbU5GVytrRnFKMm00emRF?=
 =?utf-8?B?emxoaE9lTmx2bEYrd250c295aDRwbWpEL0NZY1JLdjhtdWxnQzhnalk1dHdM?=
 =?utf-8?B?bW1oUndxNHhnRVZGaThGa2QzZ09kRnBhT3RzSW9xSUZnMXJPYWlHM2g2WmVO?=
 =?utf-8?B?WmtPc2lGakZjakxkZlAzaUMxWlNrN24vNUhkWUFXRExQMHZGRE5hQkxKZk1F?=
 =?utf-8?B?dTRlMEZ6R0hyNnlyNXVhRWJNN0lOSk5idkhuZjdRVTJ5NFpmeTcvdUU4RFBC?=
 =?utf-8?B?d3FBbnpVV0s4Y2FHQlEvQzd6Q0Noc0VSNU8wa21hZytMZW1oTUFTYnM4YUUy?=
 =?utf-8?B?NVRvWW9KQmZBUTNhM0pKN0ZZeWxGbVV3WU5UTWhFNG1TRVJzaldoTUI3bVVD?=
 =?utf-8?B?Vndyc0J4TWVLQzJWdm90dXRja1hrZjhBZ2V5Q3NTSitXUlpwWnJrRm5KRHdr?=
 =?utf-8?B?MlM2UDZKdFdjdExmc3hmSTZpOUIzdTU0VDk1aHdicG5Bb2lwTEt2aktqQ2pB?=
 =?utf-8?B?UjA0T0RjdG95bE11UEMvSEUrRWJINVI4RkphNC9Uakk4OWZ0WDRnd2tSNXJM?=
 =?utf-8?B?R1V1anZ2QTVMNjFSOHl4UXVHbTZuQlNZcXRVWVIzMXV4M3p1THdlRE1mc3Av?=
 =?utf-8?B?eTBYbjlpT2MyOXR6Rng4V2kveHYyeVRSNUlzWHd4TEVWSGI4WlhDdDE0Rm5N?=
 =?utf-8?B?aURySVJ4WUJUMDQvU0g4OENXRmZUc3VEV2U0WURDcDRwbkt6Tld4Tm9JaThO?=
 =?utf-8?B?b2QxS1pvTnNhTVNMMWZoR3JHTkZoS01LRXhJVVVaekpSMk1XdzFaOUJNUDMx?=
 =?utf-8?B?akhZbzVodFVvbk1pTDEwQW5FZ0lpKzdrb2hnalljcVpxbHNtZEtubVRNTCtr?=
 =?utf-8?B?bWhsMHdMZ1BLMDl3LzNWTDdaUjMvYXo1OEwxQkYwcldEUmx2TUpGSmRJa2Y1?=
 =?utf-8?B?VjA1NVRTbmoyQXRmVDh6MExVZktUVG5IN28yWEViNjdKREdodDVzQWl0MEdt?=
 =?utf-8?B?Z2tOUDFKdzkzS0Z2WFUxSCs0bW1neEZpVTZ2SGJDc3Zia0lrMTdDMEJUYkVT?=
 =?utf-8?B?T0N3VkZZdzY0bDcvdlRTYzNnMFpCU29zeGxtRlZGTVJRVEUyYlJSWnp1QnY1?=
 =?utf-8?Q?Fwx8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3lkUUVpc2cyT1k2M2RlTHBPcXhzK0hNMVpoVnByQndDcUdPbElrM0tISGh1?=
 =?utf-8?B?VG8zYm1YQ0Q4VDNVZlVYRzIyZC9kU0h3dHFXeExNNC9CNlg4RWlJQmFodEpO?=
 =?utf-8?B?Nm55MlVkVnY4VmRmdFAvRnZpb2s5OStYakdpTWZsY0F0Skl3T3FrTmNxMEk2?=
 =?utf-8?B?NHhOWU9NbjZ6eEswQlZoMm1Ka1VDZEo5M00vdDE0V3UxWHJaVmtWUmtHOGpM?=
 =?utf-8?B?QVlSN3M3ckt2NHJiUS96Ym5WOGcrWjh5bG5qZy9Hd0lTcjlvNDhLUk0rUEFp?=
 =?utf-8?B?M1l1NUo3KzZEaVJYN2U4UjE2SFNvTDN0b3VxbExyVGU2Mi9TcDVHSHRkRHhO?=
 =?utf-8?B?N1h1OGZuc3Z1YzhaaURGRWxxaGJMMHNQVTRERjJxV1FkdktsRXVhNjB1ZkFy?=
 =?utf-8?B?OVYvRGwwRUw0YkxjWWtYY0FDOWVESGhLNGwwZE54UXJZWkVqbXdRRHBIRWgy?=
 =?utf-8?B?dHJyQjEvcW5wTFR5VWw4SllDbFFHQUhrZXFpSkVBN3Z2QnQxcUJ0WE91UFZO?=
 =?utf-8?B?QjY5LzRxWEh4OThGbDE5eE9RcVFOUzBITlh1MDZ3QTJjZ296S25QRzVINlQr?=
 =?utf-8?B?ZFFyUFh4ZmhOempqSG9iZHR1dVpXZlJ2a0Q1UGNtLzZrZDRjdFZha040QmNK?=
 =?utf-8?B?bDBBY3JSNFJpd05RZ2l1dEtsa2p5Q2xsZTVZa3RtVHNaamtablhvdHEwa1Bz?=
 =?utf-8?B?REtSNWs3VGFUbElEbW1DaEpUaFlkck16SGtsQXVBVHE2WEtNSEFrSzNTYzky?=
 =?utf-8?B?b2ltZlZnQ1dWYXhNbGYxZUhWR1J6SXJTdHc0ME04cmRFR0ROVWhJTjhiOUUx?=
 =?utf-8?B?Z2llM1BQWHR2a3pBOUJPQzRhdXkrTDBTcS9HWm9oMU9nR3k2NHZZTFY1aFVB?=
 =?utf-8?B?QmU5SkdENkpmY3hrV3BwdlZnMTBKQnc4N3hybUJsNCtvTmNwa0U3R3cyL1Fo?=
 =?utf-8?B?UnJGV1RPUlFPbVVWTWc3dmFjN1JRTXlHTVBKL2VhVDk5dVBYUWlOUVU5Wlkw?=
 =?utf-8?B?bzF0dWM4b01sTHZtdDVSQ01sUGJhMnNNWnVmY1FyTVVYU083Ym81SU11YTFD?=
 =?utf-8?B?SHpMMUZOak9XRzE2ek1vVkdxcVZ3NG1zc3dUQ2VBa05VK202c2szdHYrT3FP?=
 =?utf-8?B?bzErc090Qmg0Y1VBTUF5VGdjTmY1WVhnZ0s1aFMvVW5NQXNhbDV6QkJhVXZS?=
 =?utf-8?B?Smx2TERIdVVwaVdlSkJSUk9BcTZNUWJHMEZHNjk5RHJyWm5qRFFXWGE3NHRK?=
 =?utf-8?B?d1VrMnZJT1h5dGZsU0w3dDJEa1ArODkzbkw4NkZncG1Lb3lDOVJqWlcrOHUx?=
 =?utf-8?B?Y0o0TUpNdHgwMlFrcXZvOEJ0ZVRUYW1GemtHM0xjSk91UmtXTkpnMHdwN0lX?=
 =?utf-8?B?QVVaYnZDV2prWkJObW1MTlYwd3loalJqZEtYbHJ1SjAwYUNHeVJFVjFtaHRW?=
 =?utf-8?B?bDcyczlQTXVHNGc3Z0RNWjRyRldiQ24zTmRkS1JXT29PWWdqTStnbzNoMTRx?=
 =?utf-8?B?ZEVRbnU1NFhZLzhxbzBKZlNSR1Bic0FYMWt1M1lhVmRWNHE0SFNwdTMxS3Q5?=
 =?utf-8?B?eG5teGdkalRBR1YxSGFJcUZkYXYrZ3VRelNBbjBJbytvMzloRjNpb2JJWHRp?=
 =?utf-8?B?WnV0Q2hzY3hCSldCQk1SZXJVQjU5MHhTUWkxSGluZGowMlR6elVYdk51RnRX?=
 =?utf-8?B?OEFTZGl0NlZmTlpHaHJ2amhaa0VvU2tHSmNOWGF4aTNtelU5Z3hjWHBwaHRF?=
 =?utf-8?B?V2xPNlZWUEhYZGZoRXFaMUZPbmV6Z2Q0VHZ2QW10MHZEcGpmaU5tUEtXek9x?=
 =?utf-8?B?ci9TN1B0ZmREeEZrNlhtZ0N0djRHWW5vMFhhdHBqWllWYktzQ0Y0M2J4TUNN?=
 =?utf-8?B?Uks1WCtycUlhaUQxU0xkRzB3MFZVUE1wYmxjeVVGazJwMkxSbWNwTG1udStJ?=
 =?utf-8?B?QlZlRDNqbnlLQUxEZVBuOU1nY05XL0I2QlBZZUJEUXFkdG5Ddk5KdkRJNDUv?=
 =?utf-8?B?N0NYeFZuVWl6TXlOR2lnZWtvRTJIL0FYd0RrdjNvcjlRMDhBY3R5RCtaUlJ0?=
 =?utf-8?B?S3V5NXNzUGpGbU1PL3lIY3FXTGJFaG4ralppWU9YcGF5dEE3SFpOS2M2Tm91?=
 =?utf-8?B?RlN1OGcydTY5Ny91RU9MQm5oN1ZabDQxVVdhRW1qQUtiek9TcE9KNnZDTW9z?=
 =?utf-8?B?NERPd2U0TXNmUldYOXgvZFpNd0FJTXcyS042eU55amZPU2gzQnFSenFIU0xx?=
 =?utf-8?B?R2hta2VyaUNuNEdwV3Z4Wjk5MTZtNVFESDNYMlZ6ZkE5Vm9vMWxOZFFxYjJr?=
 =?utf-8?B?b0xhRlJuR2xEUjdLNldpNTV5WncvdWNybWhHYi8rOWNNK0JoYVFoRmV0V0xo?=
 =?utf-8?Q?sAshvgepDcg/rBUlN38j0iILjwXY7RrVHOBZyOCmQSC70?=
X-MS-Exchange-AntiSpam-MessageData-1: LZ+UsNfNBm52hA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 366a09f7-1f4d-4ba1-b494-08de58ba252a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 06:56:05.1553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdGEClYgcXx9Y/8dvuk7FcO3nRk+OteWW1h8/7ihmZesKAjA4hV2Qbyqj61LF/h7Bi4CNkha8v0t8XdXozs9kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5994

On Wed Jan 21, 2026 at 2:57 PM JST, Yury Norov wrote:
> On Tue, Jan 20, 2026 at 09:31:14PM +0100, Miguel Ojeda wrote:
>> On Tue, Jan 20, 2026 at 9:01=E2=80=AFPM Danilo Krummrich <dakr@kernel.or=
g> wrote:
>> >
>> > I think it's rather unlikely to land bitfields this cycle. I think Yur=
y
>> > explicitly requested more discussion on bitfields and also encouraged =
the "two
>> > stage" approach [1] moving register!() first and then extract bitfield=
s
>> > subsequently.
>>=20
>> Does Yury want to maintain it? From his messages back then I am not
>> sure if he does or not (he suggested "some non-rust person from a
>> related kernel subsystem", not sure if that meant himself in this case
>> too).
>
> I can become a reviewer or maintainer, assuming Alex will become the firs=
t
> maintainer as the main developer. I can also move it with my branch if yo=
u
> prefer, guys. In this case it's better to make me a maintainer.=20
>
>> At least, he suggested adding a `MAINTAINERS` entry, which I agreed it
>> was a good idea (by the way, this patch series should add it, or at
>> least the eventual one that adds `bitfield!`).
>
> Yes it is. Alexandre, can you please add a maintenance section(s) for
> all new files?

It looks like we are heading towards introducing `bitfield!` a bit
later (v2 will only have `register!`). I will add a MAINTAINERS entry
once we re-introduce `bitfield!`.

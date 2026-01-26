Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011015.outbound.protection.outlook.com [40.93.194.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1511233A6F2;
	Mon, 26 Jan 2026 13:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769434559; cv=fail; b=d1WBRLLRmcmIZ8MTqedGUV8u5RgA3LM/YHBEowlY/U51linqJFrKdVdoatuUf3KfNznuXjKd7BRjsRTsktACi2igRW4OWem3fV3yfHqQC8I27w22PcQfI72NfpUubV0A8zimj5I2WlOJ2mrEv+a8ce8k/vpqY37XIavml7L0ccw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769434559; c=relaxed/simple;
	bh=4vuNaU6k1gJgGFmMEPBQ1MjXpWWbCHyJLtZ+9MNAFgk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=H4PofbY7VVmfTnOs77bmnJq+fxqch2jO0OszklJZF+3UyLqLCKGS2/h2CblfuLf/W/PD4TYj6jZWWlLHj7D1YofJBmv/WS+IX/+xKZpZWSNFN+PCc+j42++aNwxplnkq3VwjeaBoEtMxyXSL2k0U9kzU+m9QoE7VwEN5gnwxog4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WIuR8EVB; arc=fail smtp.client-ip=40.93.194.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WIuR8EVB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AEqK4rwuclUuzlq9LrjQcC/zQijXjRfk1E9o5GwmgEEs+i2eZdc/YUr3bYOCeAlhjUzf+FU+Z8C3VpCiuAWSzqU0Grqv0J20Up8jIqd32eol3JerE3vpGg/RniuAoorh0plUugWTjxmytILCBfOe427zX7JfwIIeAuAGMqadY8TXm0Lmhuw2NIK/bJscrFXwNgj1hHr2hsf3wn4emf4H+hg8hQi+8WEEdDU8cMuNY6xABKPWXu2cAEptaf0nyBmwS8aD1eu1AXjm64wPggf3BBaHLP0W6oJOkA405sycS24Q4g5w6vVJUbveYD5naJrRWOnUmSjFl9Bht6vUKP2joA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZwIrJ2viQnDzEvaWxgErDuEWFVHC5RzlMdFB81VZqoM=;
 b=BbUZFJEIfRU4FwdVj6phoy9WXLzpm48unYTLr85Jua83XHgBeu53QPjFM5627g5+YY+0JHXZo08URmbrlGucqM8BV8L3hXruh8uNO9UOCbTC6FrRmlMiesRF0NTPp7zwvp1VEaYTMKXSP1uWfMnFmQbSLPc5wJmoD+c9wuGAeycIMwQPLKOncr5JRZvhitUIFk/qNTiYbkntdx/x7GdjmIDPorpGCQmFnc5Dpq5p2BlDYw923dPd7/v4fVe5/8RSU/+8ZbynQZD5WE2FUbTlKrcapSVYiCuVeluayYRcmxfPhzZhQz7yHkbd3clI1/KO1XCQPFYJqoLIlb5MxGBCjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwIrJ2viQnDzEvaWxgErDuEWFVHC5RzlMdFB81VZqoM=;
 b=WIuR8EVBiR2NAu5Vcuo6UeoUgmGmDH9nrezMf+rIGjBBC4Lb4cjPRcF4IDuAUF9ufkAWHDpmRN0SFpvwJ2l0t/8Kk5AdbXsXRr900z8Yf9lpfmqhgscfgeGtNMFod6KHPLSbUAjSv2sY/rXpTt11PYCl5UdnK7RNdB4Xy2KNvbL/B3HbYokHhiyXdGZgpz273s2Nrn62OMzduE5bjvHlVSDq7I8lP1zh+VH/5T7F22dQdwFlbaFZz5/D5G8W34A6lwk7IU7VjhO45+HXX+xh7gB5pP1wTmtqH0FbirvvSVfwLCzBFHUFyBeBKDvCZfJvcDLlbpi1pC/o+ibswXdqHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7771.namprd12.prod.outlook.com (2603:10b6:8:138::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Mon, 26 Jan
 2026 13:35:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 13:35:53 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 22:35:49 +0900
Message-Id: <DFYK76F1W6QC.CCHFHL1BSD6K@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Yury Norov" <yury.norov@gmail.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Dirk Behme"
 <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/6] rust: add `bitfield!` macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Yury Norov" <ynorov@nvidia.com>
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
 <20260120-register-v1-3-723a1743b557@nvidia.com> <aXCZeVqkDrBWr1uq@yury>
In-Reply-To: <aXCZeVqkDrBWr1uq@yury>
X-ClientProxiedBy: TY4P286CA0127.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: 52ee3e98-b600-4727-72f0-08de5cdfd38a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Smk2S0gxUTlpSHdqanl0R0xqVmxyVjVYSzFOK0E1bVdYdXBkQ1FmdGwvdjRM?=
 =?utf-8?B?WGN4VUtXZkh3cUVzL2gwWjZqWlFDc3ZTQ0c2bnBPdXJNRERXaktMZklXZ2hB?=
 =?utf-8?B?ZUJMRnZOcldydUFrMVBrNUNWdHlCVS95QlkzOEZtbTc1dzZTeE9HekRmaWx1?=
 =?utf-8?B?Uzg1S0RkVHJIMkxUcS9PUUtSUUp0YWN2Vk5tVnI4Y1JsMlJQNEhHVHlYNGpK?=
 =?utf-8?B?MkRlU01zMEl3eldTRXhXdDRMS2h5bXdLTUQxYzdueldKeHh6cklCb0RqZjF1?=
 =?utf-8?B?MW1QQWc4MTZ6N1ZuSTNFaVhvZHE3M09xQXFDL3hBVHAyVW44OTRveDU2bitW?=
 =?utf-8?B?cC9teHh3cDNYM3pteU5MUUVwQ2N2TUg5ZFpCWFBrUlphanNtdFpnenh5QkI4?=
 =?utf-8?B?WEZYZkV2UVJwQkF0TDIvSTBsUFZ2aFBnWDJGL2ltV2dGU2UvTktCUUd1UVNn?=
 =?utf-8?B?cWUwU2hwZ3NVTlVVKzlmbHpGelBiTkF3ZXpCUllEWmxNN1FQNG92R2cyZUJi?=
 =?utf-8?B?alM5Z3hQbm1kQnlhV3ZYTjFQVzhEYTBXaGRVZmU2QXhnY3RiUGRRdTR1UEJs?=
 =?utf-8?B?Mjcvekg3MXdCNUZZTS9ua0xLL0M1Y2xtOWdFdnhuWVRBRVIvU1d6UHRaY0t5?=
 =?utf-8?B?L3hqakY1aExEN3JiWnBrVHlrZmp3ZDlUQ2NuTFZyMHovWUFZU2xiQm5jOWxE?=
 =?utf-8?B?YnlXQU9iL0NwOEhwU2hRRVp6bjE0bFRVZm1iUzk5ajZ1N3NvdjcyQ1ZKblpx?=
 =?utf-8?B?Tyt3UkVnclI0WE1WbjhObDh6SDZpSEVQdnJIenBwREFPQXh4UnJPa1R3VDlK?=
 =?utf-8?B?bDR0ejN0em01a0pwK3cvMDJBM3FjeFlxWThGT2JNTERLdFo5MUxxb1M2VElR?=
 =?utf-8?B?bVVaRXVtWmVKMk85Z2VpT2Erc2RsMTRJWmtPOVE5R1VRT3d1S1BZbVd2TVR2?=
 =?utf-8?B?SnBVekZnNWdQQ29kMG8xenRxREhIZ2dGc09RSjNaYnNUcTNiL2sxbFlYMDQx?=
 =?utf-8?B?RXVSNy9lWTc4TzkwcnNnU1JBaDBuemw5aHp3OXZTRDA5eVdxTTg1Vit2V2JT?=
 =?utf-8?B?WXFqUTREL3EzdnhMZGg2Y1Vlbmh0TTMxalNTSFowTXNHUHpTTndWNTFRQlBj?=
 =?utf-8?B?MGxTRERTWWlIdVJnb3dCd1NXbVdHR1Nib1dpQy9SZk5pTjhRNlp1ZUhjaVJG?=
 =?utf-8?B?VnI1YjNhWjZtS2F3WlEwVGdnN2NET1BUYjVESDVjT3prcjNvaEdBSyswU3VV?=
 =?utf-8?B?Tnd3TXlnc2VLcXVFNHhrNGc3M1VqVFNqWkFJSjhpc3hhK1oyWnhnOHd2V3lK?=
 =?utf-8?B?Qm9yRnRpNmRKcGhRSjhibXZHcEQxOHJ5YkxwS0E2UndhZEl4c3M4TG5jM2Vl?=
 =?utf-8?B?eEFwblJUMkZQWHZIM0J6ZlFXZDFYOFR5bi91V0drbU9PTzlPZnN1dTArVUto?=
 =?utf-8?B?a0ZKVzYzMnJKK2wrZVFta0dxRHMwNGR5SFNPOW9Bd0x3RTBwdGJvQ09rWkw5?=
 =?utf-8?B?MmVwR3YxRTZzSU5vK2JpM3o0S1pXT05aQWF5SFo4UTlNVldySk9wQXB5elY1?=
 =?utf-8?B?NDI0Uzl2M0Vjb1hTRGdvUGZDRXg5NGNiSUR1TDJ1emRNTUJmamo5WG1CanBH?=
 =?utf-8?B?Zm0vN3o5QW1RSzArV1lRYXY4bXY1aCtqSjZCQmhHZ3hFejJ6bytqc0F2Q1lP?=
 =?utf-8?B?NEdqbGxIMktCeS9SbWJtWTZ0TWhlajZkYmllL2xpODUwakFUdlM1WHMzWEZv?=
 =?utf-8?B?TTB3c3dEcFpxSnpkaVQ3aUpKZW1iZjJ6L2VvWGlWRkJxL2FwNGtGd20vMzRB?=
 =?utf-8?B?QkluUjM2R2o3Smdhb0RnMnlVYTh4cDVVWU5DSVMzK09VTzVYeHB0VGxkWjR5?=
 =?utf-8?B?RXlyaHJTME9vT2Y2L3JBaHprZUhHTW9wVlpkOVhDR1YrTU9RVG1TZVZJWC95?=
 =?utf-8?B?bkF1MWFUejVDZERmN3E1L3FDYnRSbjEzTEdvQWsraW1kbERYLzhUYm9na0Nq?=
 =?utf-8?B?Z01DOEVPc0ZLeGNDbUd2Vjh3cWxDRGNRQXkyMHhNZ3IweEpmd25Qb1daa05w?=
 =?utf-8?B?WTNKN0xKcVU2UGpoc3ZyKzdLb1pBT1paVW0yZkIySkNSQWZHN3FJNExnME9L?=
 =?utf-8?Q?PT9c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUtLNEpCdWhJakYxSUp6NUV6cUI1MUxJZGw5a0pCazBkUDdsN1JNd1doSjhj?=
 =?utf-8?B?ZWIzR1l4aVlvcFl0a2lmWWp5a2d0d2xROFdEQUh3NHBDRzB4V2NqYU9tMm9G?=
 =?utf-8?B?QmVuYjI3SDFqZ2ltZi9CaVFUQVhyU09vWStzZzVWR2tYSzFDWnR0VlRxWmJU?=
 =?utf-8?B?TnYwdXQ1ekhWOWw4ZWRpUWJrWkdDYk9DamFWWk9YSHpNcHJKYWpWUGJNTTlL?=
 =?utf-8?B?eStrTnlTR1VRVFJwdGNEQWlGNzVZYW1UVkRxdzQrL2lFeVVhWm8xUldYUjVh?=
 =?utf-8?B?Q1prN3VHYzIwaEdWVXlpM2tIckRWMjdva2dzSHV6WGVMM0FlM0lzaXdrMDhP?=
 =?utf-8?B?MVNOL2cyZGVjNWNhY1B0a2gxZmxFYWZZRU1MNmE1SllXYXVUY2ZCQzN6SDBO?=
 =?utf-8?B?dWdHRkQzNTFlc0l3Wlh2WDROdFNGSzcrbFVxSmM0Qm1ZdjEvL0I5cTN2cEVP?=
 =?utf-8?B?dktiMlNPU0JaaW82RWhpNitVMnFvcklrcnE2Tks2ZzBBajFCNitod2h3V3RT?=
 =?utf-8?B?a1d5OS9oTDExTmcvZFJTS3dqSVdFak9oRW53cyszTE8wTGNmY2JyUlhINGRn?=
 =?utf-8?B?MkVvQ1dBRkZ2aG1VTlpyTVlha2VsMmhWSTRLVi9HMHZLdEFxTkNFTkNTV1Zx?=
 =?utf-8?B?QlE4ZVNac0o1aHRaVi9mTlZnbVFBNk1MSFU4Q2x6Q1ZJQi9kdEgzNkJnUzRw?=
 =?utf-8?B?Zk9iWWVudTBmRFZsWk94czdUQ3dMR2N0NzJvUjQ5USt2RC9COG5KL3llY2th?=
 =?utf-8?B?dURkOElnaTVKci90aWxSdFJtSmt6bG5yUk1ZZ0gwR0RLc2t6NGlUOFliVURL?=
 =?utf-8?B?QVBFMk1XVDZ3Mjk0TVcrUWRJQy9mQkJ6R21EeEFwRlJyOTZ4dG9JTWpaWnRw?=
 =?utf-8?B?QmJtVW91RmxsOFBxWjcrZ3QrTno5ODFEaFpGaWZLZzBYS1hibVQvWmVqUlEx?=
 =?utf-8?B?bXR6eFJ1d2hUV1dudWRQQis0Qlc2VDh5MjVPYUtIc3RVeHBQWUErbVk2R3Nm?=
 =?utf-8?B?SXdkNWJNQkI2eHljSUQ3MC9DcTBaWE9HWG5kaTBkWnZ0UHdSY1UrbHpDYVlK?=
 =?utf-8?B?dENHc3l6Y0RRc1g0S2hCcFJRWDZmVVY5YzRtTjE0aVNMM2FUWWo1cHpCK2Nz?=
 =?utf-8?B?bjM1WFh6Zjc1eXJGRmV0MUEycXpyM0o1bTB1ZnU3S1ErdG9Idmg1eExDL0xl?=
 =?utf-8?B?OURqWnJjRXFSb2Q0QUxxT1VCZndJaERKWXNsZDltYzNHa2UxMWxOei9nZG8r?=
 =?utf-8?B?UWhqM204bThWN0dJWUVHR2JCS2NXbkEvbktTZ2JKSUlPU08wRzRNNDRVbUtl?=
 =?utf-8?B?d2VMZ1RBdmZMSk5FalpnYU9vQndDRG0rblVCUmlYTm42ZXgyMmF6ZEFUQS94?=
 =?utf-8?B?dVEzQ3NNbXBOaTROdGliVGtXamxOT1htbmEwenR4YmQrQWdTeEVEZXhCS2dE?=
 =?utf-8?B?RUgzdnNNZ2dkelVKYURvNTd6c210bjJKL3M1ZG9ZTTV3NFpFbDBVMklOVXRP?=
 =?utf-8?B?ZmZrOWxEOTZlM3h0b3puaGpFc1grZ2g5NXhZUXdnN3Q0ZDhQbTc2SVNpTzZE?=
 =?utf-8?B?a09MNktBT0FNWGVaaStGd1J6YzNwSEE1NWdqQ2U0WVhsVk50UkhwVHBwWmlI?=
 =?utf-8?B?d0FtQzR2dGo5cnZ0aWRjVnpYa3NIeG5McitiTC82ZHhrR2JZNHhhR3ZzcVpn?=
 =?utf-8?B?V3U0dkRPZkdqL0JtcG1Ld0Z0MEltVjN3Ylo1ZW9iK0Q3RFRKYmczWHlWbkNQ?=
 =?utf-8?B?d0xKdmQ1NElPUVNJdzhTWk1Sb2NNdUM2eHgxN0Rub2FBRHlIdVR1YXp1RXFQ?=
 =?utf-8?B?ZmRuQzJpRVprb1pCaTdnSWdKQkVkM1pSdDJnenJiRW12ak82d0NXaTNrVUx4?=
 =?utf-8?B?VlZxNzlkbTVaMHNLMjlPbTNGL2lhQk52b004WWRzajBOYkp5NHhqWk9SQXZw?=
 =?utf-8?B?RlhzNGd4Z1l6cXBnT2E3Tnp2ZHl4V011Z2NGRWVrVE4vcnA5QjhFMnNpYjgr?=
 =?utf-8?B?TVBLSktMZStlMC8vTFpUYjg5M2Z4VVRwa29SRHJ2N216OTdZSFNpcjM1SmUv?=
 =?utf-8?B?bWs2MnhtL08wOWFSMWtndS82YTNtcnRKNk9oZHhwUWt0S2UrRlNCK04zb3N3?=
 =?utf-8?B?V0diQjVIVWtld1BnZ0swSTY2S2tya3dSZEhDM3VaNHF2N0dDRWUwemQ3K3pq?=
 =?utf-8?B?VGR2bnJ5MDI0ZE92OCtBYWxHQzdGVDkvMy8wQWJEazV3QjN4RWppNDBtSE02?=
 =?utf-8?B?OVNIc3VVcURtRGZmMUIvVkZ4N2VpNytVSzE4SEg4TWJRVkVhTFY3TkVQZHJR?=
 =?utf-8?B?VXlpTzVmVVpQVWVCU1VoRndldmFFaGJJZGRGMllHYWNxN01hN3Y4Y0g2R0gv?=
 =?utf-8?Q?6xiQ3EeOGA8QOGoFk4lrvg8vEnDdx8UcflcIafLESfFIQ?=
X-MS-Exchange-AntiSpam-MessageData-1: oakE030HWVmIbA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ee3e98-b600-4727-72f0-08de5cdfd38a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:35:53.2275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pni7MhrS8i2T+VJ2yIfAPbjGy0/l3Htc5a+X8/huZthO/qihi/cekNxF/ulMmZN1xYWZvqw74hbm7MHsirXv4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7771

On Wed Jan 21, 2026 at 6:16 PM JST, Yury Norov wrote:
> On Tue, Jan 20, 2026 at 03:17:56PM +0900, Alexandre Courbot wrote:
>> Add a macro for defining bitfield structs with bounds-checked accessors.
>>=20
>> Each field is represented as a `Bounded` of the appropriate bit width,
>> ensuring field values are never silently truncated.
>>=20
>> Fields can optionally be converted to/from custom types, either fallibly
>> or infallibly.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  rust/kernel/bitfield.rs | 503 +++++++++++++++++++++++++++++++++++++++++=
+++++++
>>  rust/kernel/lib.rs      |   1 +
>>  2 files changed, 504 insertions(+)
>>=20
>> diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
>> new file mode 100644
>> index 000000000000..2926ab802227
>> --- /dev/null
>> +++ b/rust/kernel/bitfield.rs
>> @@ -0,0 +1,503 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Support for defining bitfields as Rust structures.
>> +
>> +/// Defines a bitfield struct with bounds-checked accessors for individ=
ual bit ranges.
>> +///
>> +/// # Example
>> +///
>> +/// ```rust
>> +/// use kernel::bitfield;
>> +/// use kernel::num::Bounded;
>> +///
>> +/// bitfield! {
>> +///     pub struct Rgb(u16) {
>> +///         15:11 blue;
>> +///         10:5 green;
>> +///         4:0 red;
>> +///     }
>> +/// }
>> +///
>> +/// // Setters can be chained. Bounded::new::<N>() does compile-time bo=
unds checking.
>> +/// let color =3D Rgb::default()
>> +///     .set_red(Bounded::<u16, _>::new::<0x10>())
>> +///     .set_green(Bounded::<u16, _>::new::<0x1f>())
>> +///     .set_blue(Bounded::<u16, _>::new::<0x18>());
>
> Is there a way to just say:
>
>     let color =3D Rgb::default().
>             .set_red(0x10)
>             .set_green(0x1f)
>             .set_blue(0x18)
>
> I think it should be the default style. Later in the patch you say:=20
>
>     Each field is internally represented as a [`Bounded`]
>
> So, let's keep implementation decoupled from an interface?

That is unfortunately not feasible, but the syntax above should seldomly
be used outside of examples.

>
>> +///
>> +/// assert_eq!(color.red(), 0x10);
>> +/// assert_eq!(color.green(), 0x1f);
>> +/// assert_eq!(color.blue(), 0x18);
>> +/// assert_eq!(
>> +///     color.as_raw(),
>> +///     (0x18 << Rgb::BLUE_SHIFT) + (0x1f << Rgb::GREEN_SHIFT) + 0x10,
>> +/// );
>
> What about:=20
>
>         bitfield! {
>             pub struct Rgb(u16) {
>                 15:11 blue;
>                 10:5  Blue;
>                 4:0   BLUE;
>             }
>         }
>

Oh, all of these will name-clash very badly. :) At the end of the day,
it is still a macro.

> What Rgb::BLUE_SHIFT would mean in this case? Maybe Rgb::SHIFT(blue)?

You wouldn't even have the luxury to yse `BLUE_SHIFT` here because where
would be conflicting definitions and thus a build error.

>
>> +///
>> +/// // Convert to/from the backing storage type.
>> +/// let raw: u16 =3D color.into();
>
> What about:=20
>
>         bitfield! {
>             pub struct Rgb(u16) {
>                 15:11 blue;
>                 10:5  set_blue;
>                 4:0   into;
>             }
>         }
>
> What color.set_blue() and color.into() would mean? Even if they work,
> I think, to stay on safe side there should be a more conventional set
> of accessors: color.get(into), color.set(set_blue, 0xff) and son on.

This would just not build.

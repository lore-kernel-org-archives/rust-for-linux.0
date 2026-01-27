Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021100.outbound.protection.outlook.com [52.101.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A3F2D0614;
	Tue, 27 Jan 2026 15:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526177; cv=fail; b=MuPLoYPnHYNO7oPHIhubZ2yhHsmz59XiW2GK2I8e1rb8qRzvttytDcSIJ03TWF3bhLwDVkcjZz40CeBhwfEu97JuXntjXqBbhwz+aA7jjnqYnkMofTfpovjBB2c6Mv2dDtsV7t0fGTLdR8K2NIe/rd1nsh1Sh0VLTop6qSVWZo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526177; c=relaxed/simple;
	bh=M2uREG+gox3AjjS1ydpArSIiEdfSmsh1YHC0rz5JEwE=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=ZJ7Ye1V7DLqCkmNkT5l6g9Qig0LtiI3IUQJJSZgTOKp+AGVgFsvnPbvbvuJo+LxB3FVhZtj/4EgJTFNaFMHxjiUetqDESgUTOdeaaCzHKmxtzf4g4v0SdtOXPpS8nJ0ma9ttLWGJ84hLcFiXUGnFpKQ0NHs/VXCJXI2xTsL6sq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=T4WTOMRM; arc=fail smtp.client-ip=52.101.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="T4WTOMRM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SFugSiy5jR1s9+sOh2uxSOw4Axeuo4LdMiBw7DFAJvF2xeb8F0jFuonBT/nof5BVnc/lPW63IlYR2nSuyyRHigNga9bwQ6iY+KNkxFFRMS6WTuQ9TCkYzt+uk3d9EyFwt7RUPqWF9OD+Wi7OYcw1g8SC8/Olk4/hRBgpxwJquQv68zLWDOmFNUYF2fWK9g7/OqFFywkg3P9MRgZLN+5libj46xpz41CWp3onYQ2sIBHDV2f+3PFxix9gD7Nnq/lsrb1KbmAWaD2JZRUdpgHy1s8t2TAWphugqCxcO9p1v8G2h3pva41G/8uFwjV7TPQRrYX6IRzXZz10i52YgOrWvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0QAkmg1h/klfZytgOZDgSa9gqRL2qg9sEveSJjDP6I=;
 b=zHHZljq998oG6q2FUyvyTxnu7byCVzhpi24dX8fQDnd9SVnZtRj/18foPtlUGu38oNraWpTle3j9osRotIQwuK3j5xTe5VHj37S7hDiY48QnI5nFhhcwKDuqC4fEFvFVMMqPnyHbgGFEwipbwTqr1l+TwBwP4PRh80aYx6E3oQDV4xU+I9amjRmIQADZIEVf8wJkvSpCb33NnFjjHYnH/KiPjAkKh94yeyb52hUCkmk/p7StpRFUk1/RyS/buqNPxv65HlyAjRS0l3SEENgLhEb8LFTXy2vMgO7ExqPhtpp7YI6Ki82bFGWJs2zBVkFtqgpqfRKlOKePZLYpigHtYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0QAkmg1h/klfZytgOZDgSa9gqRL2qg9sEveSJjDP6I=;
 b=T4WTOMRMIEu6Csya+qN3EAaRSEMtkyLPTCYd3BcAtc7Bi6EfoxCf73JvCK6Q8BpYm8XbdVeIimVOiXAu7/PkHZMZEHC1vhpDxx8DqS8eAgFe9QwuoLQ9i7zq4JqW524pKMXfa8+Mfbw4RurTwTvCwFeRyip3Ex+jMn8O5/oW5SY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO2P265MB3595.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1b5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Tue, 27 Jan
 2026 15:02:52 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 15:02:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Jan 2026 15:02:51 +0000
Message-Id: <DFZGOCV6VP2N.28M0CWIONBGMW@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Yury Norov"
 <ynorov@nvidia.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Yury Norov" <yury.norov@gmail.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Dirk Behme"
 <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/6] rust: add `bitfield!` macro
X-Mailer: aerc 0.21.0
References: <aXgpKOHAmvZuMVSt@yury>
 <1C5C477A-2CE8-4B25-B968-416B89EA617A@nvidia.com>
In-Reply-To: <1C5C477A-2CE8-4B25-B968-416B89EA617A@nvidia.com>
X-ClientProxiedBy: LO4P123CA0286.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::21) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO2P265MB3595:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fc2c7ab-eeb1-4605-65bc-08de5db524cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXc4ZEt0SDFpaEpNaVFSU2F3bnNtZS9BQkJxSy9qWEk5aTBWK1JBdVhON2FM?=
 =?utf-8?B?ZkRaaVdrWmZXYUZyRjJjWVJHQS80MHdabDZqVmVJTmJ2VTdEZEQzRnR3bmNU?=
 =?utf-8?B?dU04WVV0WFM5L2hXMXJKVTRQMnM4eEJxZnp6UHArMHNqdndVV2ZBeFY5NXpt?=
 =?utf-8?B?dzdSMVdoNk5rd01qYzRLOTlGOWhKQUdVd05xZkxyOUxhcnZWaFN3dS8zZXhW?=
 =?utf-8?B?eW9NczhxaVlkd1B1RFFYY09zblhMUmU5Vk8xZUd4NkZHa3V6RzQ5MWxKTHhj?=
 =?utf-8?B?QWxGUENFMlhqZHhsUGo2QmRLOXRSVnQ5VXQ5VFlZb3NiamZGV1pHVGJsODBp?=
 =?utf-8?B?clBhQ0ViNzJVVFVmNWJrWVVZNmZQU1JuTXNYM3hCa1hQU2NLdCtkeUpvbWNy?=
 =?utf-8?B?OFd0Rk5uRXFvb2labmxzL3B0SklzSGxiS2FjMitFWjYxRkc0Q0pNd085RFoy?=
 =?utf-8?B?UWtRd0VyU3JIOTJyeE0zTGNKTFJQTUgyMVVaWEFzdG1DTTZCeDFKV0U1RUVI?=
 =?utf-8?B?a0FsQWxVaXRQam00SHgrcVl0YlI5YWNNbVAyRW8vaG5kSzRFY0NQS3l5dXdY?=
 =?utf-8?B?dVlOUnBGQXJKankrMEJVZlh2cW5acDFWbnlCT1drbDNaM21BQXJBY2F4RHNJ?=
 =?utf-8?B?Nzl5bk9raGF5djZ5NGJPL1ZWS1VTRmxtYVVYdTQ4b3AxVndrbldON3BDNU5i?=
 =?utf-8?B?dzhhL2Mwa05tVDZQRWlTb01IenhaZlpUNHZGYjBvak1HVjVVZGh0VXpoQjdF?=
 =?utf-8?B?Tjd6bUJaSHk2R3FiMkN6MWhNRCs2V2ZwSHpqaGhuU2txNzI4WDNZa2FZSzlW?=
 =?utf-8?B?K3hNeXRjMHB5MWVseURXTmdEbzRlR0JPbW5ORlR5cmdnR3gwU0Q0cmRkQVUr?=
 =?utf-8?B?UVF2V1czbUM0clhLK2JFRlNVVW1Vd2hKTUppTHdiMUVNTm9MREp4aC9DWldZ?=
 =?utf-8?B?V1hOcUhBQS9NS3hISGlYYWZ0ODUyeDRnWElibFZpeVZndUZtRmd1cVVjV3dQ?=
 =?utf-8?B?TDJjYkJZcDhMZWtzVHRSUGNxY3VXSmg3UHJjUVhYaVZ6VEtTVi9zTGJRdFZm?=
 =?utf-8?B?Y0JYTHZ4elJnazhMRHljV0lSK1Vhc25ianQ3QkhWVnlHM3hzVzQ4dk5ZazVT?=
 =?utf-8?B?Z0JDRHBKcE5ZNzNibW80SWVhd0JHbWNDRzBKNkRXeXhxVytPbFBCS1YvOW9y?=
 =?utf-8?B?a0hRKzQ3bTMrSVY3UHFCVkZxOHVYK3BWdG9jaXlxeGpQaVVKdXoyRjhlZDdG?=
 =?utf-8?B?aVBMSDFuWi9vd2dWdjY3ZHdzQ1BFNnEycWtWa01zZWhXNHdLekN6QW5vNzYx?=
 =?utf-8?B?Qm5XMWcreVdvNUdqc3QvTU5mYVJzUDg4dG92MTFqQUFRMHQxVmg5MDdRRWtx?=
 =?utf-8?B?TWpLWWo0MkJyRXJvUUpXdXpPVnZINFBWd09DcXBsK05GQzZhUm5kVXdJRWV0?=
 =?utf-8?B?Sjk1UzlraEh1d0VLb3lQbzRBRUs2MjY0VDI2bS9qT3FLRzFSM0w0Z0Z4Qm1F?=
 =?utf-8?B?OWMxalpabm5hMVIyVTBiWnB2dUFKK1l1SmxIbTZ2Tm5QWmRsb293R2MrMElO?=
 =?utf-8?B?YmhHNVZzU04vYisyMEdVYkFuVHhKUEVOQTEzakpjTElIZGQ5QVVSN0pseTlk?=
 =?utf-8?B?Smt0cEdsL0dLWkZOQUdxUTRDVkZIN2pHYW5lQ3dtRy9NVGNMeG05QnFldDVE?=
 =?utf-8?B?cmxjK21aQkZBOTQrYlVnVmo3WWNJSmR1cy8yNUkvbTRrTVBNVFNYVHlzVXo4?=
 =?utf-8?B?VWFlZFZGNGRtVW12Y2E2S0xiOUFrV2EzWXdvOVp5MVB0bzdQVDdZUXNPNEFD?=
 =?utf-8?B?ejlzSGlDZENYT2lNejhtV0hkVEEvMVl6Zkg4cFdkVjY2YjAxbUc4YWVEVENC?=
 =?utf-8?B?NlEzNE5YdXFOK1hxRWlHL2l1RnE1b082TmlrRUEwaElkaFY2V0Q0UkJCTXRn?=
 =?utf-8?B?VVk3ZVVCR0J4SVN4enV2VCttbm5lV2VkS1NQSlk3c2E5WThWa0M1MEFzQmtT?=
 =?utf-8?B?Mm0wc05ZY0VCU0ZMQ2JiaEJBL3NBaEl0V01yNEJEYzJvUjF6S3ovM2pBMVhm?=
 =?utf-8?B?dVFwTzRxalUyTjVIdXVLdDd4bTF5c2ZqZmlCVjM3OW0vNGl4elRBYklLMW5M?=
 =?utf-8?Q?bYqM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N09rOEpOY0JyNVJVdE96TjlyM2R4R0s5L1QwUDdaMFdyTStOcmtScVllZnVn?=
 =?utf-8?B?dTZvQWt2SzBZdWZ3cXo2RGxCeWFvbndKK2t3Ujh5NGd5WC9ickNhRGZpMmh2?=
 =?utf-8?B?YjAzbW1IZmx2MllOSzMrb25rN3hZbkJ1Ukg2OUkwVUVHL3NYdHhreXQ2eWsr?=
 =?utf-8?B?UXQzamlJWUt3SS9WMVM0dHNYc1dqMW5XeWlwbDhrS2FqL0NON2hMbTJCNGE0?=
 =?utf-8?B?aHFGMHhKOFBtcXZHSG5GWmF4NFNFMlF5S1g4K2p5eGxvb1BtUGdweG9oeG9x?=
 =?utf-8?B?V1Z2Y0NZRFUyaFlBbi9PYlhLK0xmYXJhM1pnZStGSy9CZ2JkQUNLQkpzQW04?=
 =?utf-8?B?dlFwa1NpdnJBZldLOVBDZjEvKzlzR0tpUU9VMzlraUJUdmdMTGk1ZFBpSCtT?=
 =?utf-8?B?UG9ZU2dyeWQzc3I1dzNzalF5RG1DZnVZSVdzeVpFb1hkZFZyc2pQY09rbGQ3?=
 =?utf-8?B?VXBZV0N2blBQOUVtL21mK2ZYOWxkSytxR0Q1QjNUcGFuWkpJRTJ5djJ6VURB?=
 =?utf-8?B?SGFpY0FxWXdKc0VSY3hnenBkM29oM0NETzFLRzQxcXVFTGkxbnNmRDl5RXNT?=
 =?utf-8?B?RW5hUXB2TFRmdlByb3lLV21ZV0V1K21CczBheW1FS3hnR1JlV0krWmRZQjBD?=
 =?utf-8?B?ZitJbGZHRzRwTzBXRzBqcmFoNkZJNjFlWG14UW00VWhRSWVxSzh2cFpXUWhv?=
 =?utf-8?B?R2lIWVRJT2NjckJBam1ua2Vid25iS3lQV1o3bndZazRwMER1TWQzU3ZrQmpw?=
 =?utf-8?B?UWl0ZEhJTk5TSVBrTngxRmxtd1NrMWJxTnZmTC84aG9CRzFtbmJ5T29QM0xl?=
 =?utf-8?B?cllUbExYYjBmOFh2aGFKMlh3NEtqcEI3YUtHLzV4cllJQ1N6SnJYT2g5eFZk?=
 =?utf-8?B?NkRwVG9kaWEzVm92VU5YcnN3YjMxUW5yRWNUWEFqUGFDaUgvUFNQYnBFL0l6?=
 =?utf-8?B?NnVsK2h1bzZGMld5NVhVM2theE5nZThLNkhyZEcybVIzSVIvOGUyRHUybmNC?=
 =?utf-8?B?UmNLYkU4cEVNS0NRbEZBQk9TbnNlUzVaNjUxUE11enAwdlBHYkRPa2VaRTZt?=
 =?utf-8?B?Y05jSVFYZmZ1VUFVbTFRZzZlQkQzSVdJb3RSNklaK0JZVmVWZTE1Yks2NzVz?=
 =?utf-8?B?d3RPcndFbHZKbVB0Sjk4allwOUt0VlY2TnhxUW1YM1M2ay9tWGhmZUVmTFRJ?=
 =?utf-8?B?RisyblpOZFhwS3VsdGNRYXVGcCtIMHFOUGhnVjNVa0l3M0ZxNEVPUGtaUlhU?=
 =?utf-8?B?UUw1M0poM2h0bmFFUWs5QjJIdTFKNDEvQzR4QkY5NUJJVFAxd05JOU8vTTND?=
 =?utf-8?B?Vkp1cVhRdUNkQ2tKM1llQXUxeW9vb2Z3NXJFWmNWc251M0N3M3ZRb3B6c3I4?=
 =?utf-8?B?MTNDNmhxejZyUDdpcWhRWFVQQVArN2dua1VLMHdtQi80c3RiMmlON2szL1NZ?=
 =?utf-8?B?OGY2L09tV3RCdEg5Tms0SjFGMHBRY1hOWGphTVNCaHQ4ZHhXZmtBbDVnTXd3?=
 =?utf-8?B?NkI5WmJHRzBNWWZKV2ozSlNTaVo3N1Ivb3p1dkJQK2dOdXJUVXVUdTBVQ3JN?=
 =?utf-8?B?T0VLdTcxc2ZPamxSUVY4T2dWNUN1NStPaEl4aTFtdVNhbDhqa2NuSDRXMEp0?=
 =?utf-8?B?MGR0NmNzZnNSK01ERWxTOGtmQUpwdG1uY2pBTnQxMGdUT3ZRYmVxd3hpQk1Q?=
 =?utf-8?B?MlZiOHFzQk96SmZQSjRLOUdDKzZzS1MvbHc3Q08vR2pJRzgrV0p0S1d1eitZ?=
 =?utf-8?B?OVpsZlNtdmthc01NbnVNYjVISEk1M1RsRlRyWDI4U0VHdXI5SDVVOWdDSVhk?=
 =?utf-8?B?OUdhWnhEREN1MExaYy90bHFrcC82TXM2LzVDdE9BRXByNVJONG0vbnZiZjhG?=
 =?utf-8?B?UHpZSUZTeC9CZ0ZpQXZqTFlvV2FKQm9WUTYvMlRFVUVLTzUzMDFSRzh0eDE2?=
 =?utf-8?B?akVsWmUrZHFQWFdyVkFzT1RhMTgrR01NbkhwUlRGdHkrZzFnQUFhRlE5ZmpI?=
 =?utf-8?B?MlhyZFhGaGNTUE5yR001WlVCU0dJdmhlUzFzQlhvdXlMTlN4RkQvM3FVb2o1?=
 =?utf-8?B?UUZCWUdDOVhyNDQzM09vNEdoV1ZXUnZ5dzE3bmw4dlpwSER2MzBNY3oxSGV4?=
 =?utf-8?B?ZFVBbGJma0o1WHN4SW5jdHVHUk8zbWI0QUhNQmxMa2dPeGkwcUc2NnY3NDVW?=
 =?utf-8?B?M1U4bU1YWG5aOUlPVXk3VFpSa1lGNHo3azFlMHV4VHZQZFNLL0I3YmVGSmVN?=
 =?utf-8?B?UjlUeTNlUDY5ejducThDaTlsZFAxeDZRSnNZUHRYbXcvd3JHeXNtOGNDZ1U5?=
 =?utf-8?B?YTRiOFpYd2tMVEY4a3YyeWVnN0JrZlVEWUoreVFLQ0diUWE3ckdEZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fc2c7ab-eeb1-4605-65bc-08de5db524cb
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 15:02:52.1698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkmdTFeE7TDpNAiNbxrT/bKrqTVn/e6ylqRaRzSRUlDBVW+vqRJoBo/IQbTOpHfdLC9YIOEVN6MOzx9s0hsnfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3595

On Tue Jan 27, 2026 at 3:25 AM GMT, Joel Fernandes wrote:
> On Jan 26, 2026, at 9:55 PM, Yury Norov <ynorov@nvidia.com> wrote:
>> On Mon, Jan 26, 2026 at 10:35:49PM +0900, Alexandre Courbot wrote:
>> > On Wed Jan 21, 2026 at 6:16 PM JST, Yury Norov wrote:
>> > > On Tue, Jan 20, 2026 at 03:17:56PM +0900, Alexandre Courbot wrote:
>> > > > Add a macro for defining bitfield structs with bounds-checked acce=
ssors.
>> > > >
>> > > > Each field is represented as a `Bounded` of the appropriate bit wi=
dth,
>> > > > ensuring field values are never silently truncated.
>> > > >
>> > > > Fields can optionally be converted to/from custom types, either fa=
llibly
>> > > > or infallibly.
>> > > >
>> > > > Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> > > > ---
>> > > > rust/kernel/bitfield.rs | 503 ++++++++++++++++++++++++++++++++++++=
++++++++++++
>> > > > rust/kernel/lib.rs      |   1 +
>> > > > 2 files changed, 504 insertions(+)
> [...]
>> > > > +/// // Setters can be chained. Bounded::new::<N>() does compile-t=
ime bounds checking.
>> > > > +/// let color =3D Rgb::default()
>> > > > +///     .set_red(Bounded::<u16, _>::new::<0x10>())
>> > > > +///     .set_green(Bounded::<u16, _>::new::<0x1f>())
>> > > > +///     .set_blue(Bounded::<u16, _>::new::<0x18>());
>> > >
>> > > Is there a way to just say:
>> > >
>> > >    let color =3D Rgb::default().
>> > >            .set_red(0x10)
>> > >            .set_green(0x1f)
>> > >            .set_blue(0x18)
>> > >
>> > > I think it should be the default style. Later in the patch you say:
>> > >
>> > >    Each field is internally represented as a [`Bounded`]
>> > >
>> > > So, let's keep implementation decoupled from an interface?
>> >
>> > That is unfortunately not feasible, but the syntax above should seldom=
ly
>> > be used outside of examples.
>>
>> The above short syntax is definitely more desired over that wordy and
>> non-trivial version that exposes implementation internals.
>>
>> A regular user doesn't care of the exact mechanism that protects the
>> bitfields. He wants to just assign numbers to the fields, and let
>> your machinery to take care of the integrity.
>>
>> Can you please explain in details why that's not feasible, please
>> do it in commit message. If it's an implementation constraint,
>> please consider to re-implement.
>
> If the issue is the excessive turbofish syntax, how about a macro? For
> example:
>
>     let color =3D Rgb::default()
>         .set_red(bounded!(u16, 0x10))
>         .set_green(bounded!(u16, 0x1f))
>         .set_blue(bounded!(u16, 0x18));
>
> This hides the turbofish and Bounded internals while still providing
> compile-time bounds checking.

I think this could be the way forward, if we also get type inference workin=
g
properly.

    Rgb::default()
        .set_read(bounded!(0x10))
        .set_green(bounded!(0x1f))
        .set_blue(bounded!(0x18))

is roughly the limit that I find acceptable (`Bounded::<u16, _>::new::<0x10=
>()`
is something way too verbose so I find it unacceptable).

I still think if we can get=20

    Rgb::default()
        .set_read(0x10)
        .set_green(0x1f)
        .set_blue(0x18)

to work with implicit `build_assert!` check it'll be ideal, although I
understand the concern about the fragility of `build_assert!()`, especially=
 when
Clippy is used.

I am planning to at least improve the diagnostics when `build_assert!` is u=
sed
incorrectly and the build error actually occurs, so hopefully in the long r=
un it
can once again become a tool that we can rely on, but in the meantime,
if all it needed is an extra `bounded!()` call, it doesn't bother me that m=
uch
versus the full turbofish.

Best,
Gary

>
> [...]
>> > > What Rgb::BLUE_SHIFT would mean in this case? Maybe Rgb::SHIFT(blue)=
?
>> >
>> > You wouldn't even have the luxury to yse `BLUE_SHIFT` here because whe=
re
>> > would be conflicting definitions and thus a build error.
> [...]
>> > > What color.set_blue() and color.into() would mean? Even if they work=
,
>> > > I think, to stay on safe side there should be a more conventional se=
t
>> > > of accessors: color.get(into), color.set(set_blue, 0xff) and son on.
>> >
>> > This would just not build.
>>
>> I know it wouldn't. I am just trying to understand corner cases that may
>> (and would!) frustrate people for decades.
>>
>> I understand that this implementation works just great for the registers=
,
>> but my role is to make sure that it would work equally well for everyone=
.
>> Now, for example, Rust, contrary to C in Linux, actively uses camel case=
.
>> So, the blue vs Blue vs BLUE restriction is a very valid concern. The
>> same for reserved words like 'into'. As long as the API matures, the
>> number of such special words would only grow. The .shr() and .shl() that
>> you add in this series are the quite good examples.
>>
>> Let's make a step back and just list all limitations that come with this
>> implementation.
>
> Why is a build error not sufficient to alert the user to use better judge=
ment
> for naming?
>
> This is no different than using reserved keywords in C. For example, this
> won't compile:
>
>     int if =3D 5;      // error: 'if' is a reserved keyword
>     int return =3D 3;  // error: 'return' is a reserved keyword
>
> The user simply learns not to use reserved words, and the compiler enforc=
es
> this clearly. The same applies here.
>
>> Again, this all is relevant for a basic generic data structure. If we
>> consider it a supporting layer for the registers, everything is totally
>> fine. In that case, we should just give it a more specific name, and
>> probably place in an different directory, closer to IO APIs.
>
> The Bitfield macro is very much required for non-register use cases too.
>
> --
> Joel Fernandes


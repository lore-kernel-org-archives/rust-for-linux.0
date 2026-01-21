Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020119.outbound.protection.outlook.com [52.101.195.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0626F3ED13E;
	Wed, 21 Jan 2026 14:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769007025; cv=fail; b=KS92YNaKcJ/5epxnpooBifpDzDIRb1h89YAkwvHxW2u7HejskhorXeSvsO4KpIPSXdZvFxiiSfjIMhUXPZPUfCXL9fE5VOve9wJksGS9EZxAK/xoP5kN9rWX+nnFlf5M2Aa1DyWbX+uJbXTCEWVhoqGQczVUz023+YZm4vBtuP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769007025; c=relaxed/simple;
	bh=/9Ymujbn80xQiG/4hgaOpwNEhtUVzWrkaA68qtnP5Gc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=GMAKrHR9TnqQXWZ9vk5z4IwxVemO9Bu0PWc1hQmRhZ/V4/aIJF6+P9XFVo6fiqr209HTDLrfqfyM2mIsaEcd2eq2JYSDF+XgDV9zyaOVcCPbMo5rQo245yQwcjWlgJ2EeiB20e4UBm0Vm8utMmvIelC6/cD6HU+ebUWKHF/0qn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=LWJbqlik; arc=fail smtp.client-ip=52.101.195.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="LWJbqlik"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qLyahqALrL4dQPWeHFW+EWbs13rdgCYnrCvxLY8KVlFm37LcsX0GBxPzDMynINNnPPs49sYZ9wFjNhC0tHmLKxM3d7EbPXx4+LI964xSWkbF3QiHsd6DSa5Pl2TB4OkHgiRcHIlL+nShaWstumgSdiiC7zQOO7UW/3m/GMRnu7vTwdbjRgert4VjgpqxqDzLOr90vAQkPHk3kHDNSVXk8WMqI5LY+q6Q9ySh70g4Je+lbfZKMYmAa78FwfntoPWFQBdrJ9NvRBhcUS5RzarOhBMCi1jpzzBlrc53IpjZCxYhgNyxcisKuix0WxVVJu/FdBqHsJYKCidyLojWb6tBeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wF7gJiux0TRmByhbKQmzaZGNUWYumqHZfFXFXEj+AC0=;
 b=hQ3F8rq6W7ggQ6euHTsFwnu0X8C5Mtlf4ziCepC7IVxOxTulaI8B4x5zhH2FreBfEIkNaR4WF33bc07KPPVGl3t1h8xu9gPBrM8iBa1neJIlwaRMvbpND1PooykgfEPoANFWhDE6H8ht89zPdZJunKJUrEGscZ1dQFGhVmtK3rtBi7MM1jHTQ+d09YBNmiK4a+nqkSQYlrmbAijbsUFCY1DHU+tamjViPzrIHbt0lsCJrQSnF9zlqpwSbJrRFOZGcpDOqJqf5QYEsoLQFyDG5Fv+OPffHtuFJmrs8F2igTPge4jhLLoQ6iuO8PAm3MoOtUBZ/0xgzF5UXOnBHgDgdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wF7gJiux0TRmByhbKQmzaZGNUWYumqHZfFXFXEj+AC0=;
 b=LWJbqliksGUC9wGeupBvZk53UzBghHYsdaX7Gq3gcOnFZSTjkNEhiN+ZtELLvVLQn99YcdYBJZCOvU9G+mvCz8cKqCwMUvJ+yu/n84Wdy5HTceGu7ZHAYWvJwitEAE5ACUTyxDd6Q6QAuIeKt3tvwbdUSIQpsRDF1K9pp65zBwI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOYP265MB1872.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:f2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 14:50:19 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 14:50:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 14:50:19 +0000
Message-Id: <DFUCNHHYB6VV.43MOY4Y1NV06@garyguo.net>
Cc: "Yury Norov" <yury.norov@gmail.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin
 Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Dirk
 Behme" <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] rust: io: add `register!` macro
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.21.0
References: <20260121-register-v2-0-79d9b8d5e36a@nvidia.com>
 <20260121-register-v2-4-79d9b8d5e36a@nvidia.com>
In-Reply-To: <20260121-register-v2-4-79d9b8d5e36a@nvidia.com>
X-ClientProxiedBy: LO2P265CA0285.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::33) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOYP265MB1872:EE_
X-MS-Office365-Filtering-Correlation-Id: c3bd01fc-5ded-4691-5251-08de58fc65cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|921020|7142099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?azBnbkR5b2JaQjlrYzdHbXVpZDRYK0tUMnJ4Z1VzSTlQMXpKVkNDbWNRRndi?=
 =?utf-8?B?VkpyMTB6UnBrNitOTE53Vkt0V3dDSytIclIxTjF5cFJYK0REaklDMWhlK2xZ?=
 =?utf-8?B?NGZEckl2eFB0ZEdEL2xDd3hDWkNyWXVPT3hYeTJCL05xT2ZxRUhGekZtWkhL?=
 =?utf-8?B?N1IxdkhsTzJXYUptaHlJM1VrVjNWemZpaTQ1eDBHNjVrblk3VkZtVmlXK3dB?=
 =?utf-8?B?RkM2c1lqaFJGNkFCemRCa0xGZTk2Y1FWT01LcXFLV2trVHNjMEdvZ05UaW9D?=
 =?utf-8?B?eVZyS1Znc3Y0UXVMU3dQTldaME1JVjhuNlpVWWpHZ3VLWDUzbHlwbjJGVStn?=
 =?utf-8?B?cW5INXlIZVJweE9scnF2bEZoTnp5d2Q2QUhSQWY1S2QyS1l5dGxTZnlaWUNv?=
 =?utf-8?B?MVNoY0M1akQ3T1N5N1lnQnNDcXZFdW8yK0xzWGpEVGhGZnMrMGNzREdhUkho?=
 =?utf-8?B?YTY4dEpud0w4Wk1Xdmh4UUJrNGZPSHZoNXQ5VTJpRk5LOEFvenpCYTBrSjFu?=
 =?utf-8?B?L2JPbXd2NHloYmdDY3l1TlZITGJvODF6aUpUaWtSSGFYdWc1WG5FbURyS1lG?=
 =?utf-8?B?OGVEOXhhSGZqSllQUlhOdm5hSGVWM1UwZDlDRWR4TzVzSGE0VnllMEpXSU5y?=
 =?utf-8?B?ZkExSnZwc1JyMlAzcjhibS81U2dsMWpYRUFxaUcxR01xUGNNV0s3VWtQR3Nr?=
 =?utf-8?B?MmNDQU5wTDdHUS9IMHJoZUFOWU44eFQxUWtuZ2tLdnh4YW1WcmJCbjVicU82?=
 =?utf-8?B?VkVHcGNJbGg4SmczM2szSkg5ZGUvc2xMQ0M1S3dNbUlnTmlLbzJhUC8rWEdO?=
 =?utf-8?B?SStLNVlTakttMCtreVR4ZXA0VFFNOVNrUXMzSWpTcmdBakp3dUVyUWdkUW55?=
 =?utf-8?B?aDhhZXQzQTRYclhWRVlmZ0xnUEZpMUk3VFMvQlVObWU0bmIzbnJYbmt3bHhQ?=
 =?utf-8?B?L3ZrTFJQSk5JWVNBU3JlTTlKN0lXQU9HT3ZZUnFWK09TdldKOWFvdFhuLzRR?=
 =?utf-8?B?aUI4ck9qSys3emcxT1J5c3ZxVFhjeGVWcXZHUExPL1VrbHMxdk5PRGh4cnEr?=
 =?utf-8?B?NWtKUFZHQ2ZMTUFQUWFXSUNWdHlsaEdoVnVqbkpwOGxRT3VjcUdnU0gyMmp0?=
 =?utf-8?B?ZlJCbXZseVhjTzlaMDZBU0NaVGc3M3NsVGFDUlh0ZlRVS3Z2NXFZT1pnQlhw?=
 =?utf-8?B?eXAwTmtmZXBGUmhMK3EyL3BDcm1nUTMvNFU5Q202elVBRFQ3bVVYdi9RSDRZ?=
 =?utf-8?B?TnpuNnJZVGFCcjhqYmNEakw1ajJCaVUzeGh6akt2Mmgzd25YdTV1eGJmTTdE?=
 =?utf-8?B?eWxNeExRaG9FMjhOQlY3THVYcTJVY0JJbml0SHBkY21aTVlTOElzdjlsWUZy?=
 =?utf-8?B?RXlFOVlqQ3hhNzgvbDQ2bGU1ZXZ0eG5lM1V5VWlvU3ZvSUw1R0xZTVNnSUZ4?=
 =?utf-8?B?RkU1dVJXVVZJclBHSnBNUjY5Q2V3d0VjVTZDNmxLRGFOdDZWL1lRZEFSTUwv?=
 =?utf-8?B?aFM3N3BzdGJTUzN2bFd4MnBwS2V6ajhjU1ZxNUp6bTUwVy9MY2taMENLa05s?=
 =?utf-8?B?aUlTLy91TittRi9oMWlBNzE0SitISk1KWHlVTW1RMHdVSXlldEJ4K1ZXTHNW?=
 =?utf-8?B?WVp3cjlBMWxVOTNXOUpRdkh6Y3VMVUxJaEdRa1Q2N3pEV0EvTEVLUm1hSWhF?=
 =?utf-8?B?bXlFbFlkNG83N3RmQnFIbUMrdnNKSEg2WmpCTHNuS1owdnRtNmt2elhoM1dF?=
 =?utf-8?B?WEFxeS9YZDFhTVcrbTNSQWYzdEdyQVJ2VU16aVdUb0xWeUUwM2RkRU9iUHNF?=
 =?utf-8?B?SlByeDE5Q1h3MVFOTjVsc0o0d2pvVk9jZ0NXRG5Qc1VmNFhPQWxmUTBPdVVM?=
 =?utf-8?B?QmNwVXZ3WS8welVZanlQMDBSWjJBdFJkN2srY25wM2NOUDlZa3dvWTQ3ZEFn?=
 =?utf-8?B?STZuNGVVenVYOUgrZ3pJemZmenkrYWZNTThwREFLdTd4cElUSW1CaElxTWRz?=
 =?utf-8?B?UlpNWThzMzVNRlBZOTJnSTllSTFubW1kYVB4SlpRZTBmYVVkeTlRMXpWT1pZ?=
 =?utf-8?B?dkt5Sy9RcVY3S3dYMENDQk9YN0FFOHJERUkvTWxNVE5iSFNoSmNaTnhGalhI?=
 =?utf-8?B?dVFnK1BjSkpIMnArOEZIL0F0RWVVY2paT3V4OFRHTmtRMXNPL1JlY3hSNTQ3?=
 =?utf-8?B?b1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(921020)(7142099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUNrU1UzWWJpMHBnbGNOYnkrVGNEQm02bFRlN0RLRkdlT0RuUGJnOGVNdmxH?=
 =?utf-8?B?MVlrdHFSK3RscS92RHZDdHpKVVFDZU4wNlJtQ0NxQnROSWs2cndKb0lZT3NG?=
 =?utf-8?B?RlMzOGNiNVNJTnZsWFYzcUdOTnJwZmJPaUFnT1BKRmx2UWVWa051dHIrNlVh?=
 =?utf-8?B?SVBrVG1xN0JPWlVtdURZaHVQUWZQa1E1b2hoc3hNVHo1MWNSaHNUQnAxdjY3?=
 =?utf-8?B?cFBVODUvTXBPeWdRRnB2SGl2VFhQQ3ZSUmMzOHZuNVNvYnlhUlRXMDBBaDRK?=
 =?utf-8?B?MmJiaUtTdzhpRk5xS1lYOWZTSkhqWE90SUE5dlNwWCtyRjdUUXNqL3JRR0hZ?=
 =?utf-8?B?RFpNUld4WmtYRHNoVmFvMGV6dHNvOUMzajA4UVFCaVdYWXJsU1c1Vm1saVZP?=
 =?utf-8?B?Z0FvMmxHbHJyM21FaHVJL2o1V1FpQ1VCNnROV25kY29URDlVd1c5aThTdHgy?=
 =?utf-8?B?VDZNMUoyTXo5OUJ4RFJvbjhwYjRGd1ArNTFUY2hLcnA1Y0ovSGhJOG1Ha0xN?=
 =?utf-8?B?NnBvU2diMHc3djgyK1BZY3lKYmtBcTMrMjBObEFaRlhLWlFsRms1UG9ZbFBH?=
 =?utf-8?B?WnI1ODFydDR0UjdJcSs1aTFWczNvcmlUZGNYTU1laThEK1hsaWdSOWtBdVdw?=
 =?utf-8?B?Zlpmd1JmVHVuVVpJdUNyT1k3eElNU1ZYL3lJR1pGaVNML1hjejNtb2cwczk3?=
 =?utf-8?B?RFlTOUk3V2x3eWwvQWc2QmhxYzhtLy9mNTJnaEZwYTJaZTNXRm9IbkR4Nkk4?=
 =?utf-8?B?VzNSb2JMajIveFBRRkFLbGx2cUVxdDJ3T2lmUFhWcm1oR2FIcWlYc0Y2a1NQ?=
 =?utf-8?B?N0xYYU9ITUFnSFB1SlV1Z2NGV2Y3eWdyVFJGdUNEZVVlWXlxSkQwVVVOd3kz?=
 =?utf-8?B?U2hYY3d1emtVUmUzT2REcGJNUkxlcml1YnB6cEtCUkhuSlVObzc3REVUY2Rx?=
 =?utf-8?B?MFU1SVIvbXRLbVJTQ3ZxV2RyVkw2eFIzMzVYSlkydllpRmNxMEN6dU1GRHph?=
 =?utf-8?B?OGsraGY5SnJCMTBBOUZtMDRGSkhkeWFwOVVsTUdUM1pEYjRpN2NXWXFKQm80?=
 =?utf-8?B?RUIxcUhOcG91bk5scW9lK0IrV1Z0am9iNXVHNWV5Um83M2hxcVJ2R3A2SEZu?=
 =?utf-8?B?K1IyWGYwd2FpTi9VOGI4WWljdEFLTjN3NjNFajNXSHBWOGsyN3FRdHY1ejVC?=
 =?utf-8?B?a1ZqbUc0K3ZJRHB6N1BrblV1NDdzYWRDa09TblNsRzlMQ0U3Z1dnSEFFbVA4?=
 =?utf-8?B?eVlkWG5INE5aQURBaENjd1VVaHhpT2NoK3FKOFEvSllXUGFBOFc5QVR0d2hp?=
 =?utf-8?B?ZFV1WU5FaDBxMEFrS05jYVFUZlY0NmdoNUhqaDgyUUJxT0JaWFdYZ0J3cGJo?=
 =?utf-8?B?R3BIZ09FRU5mSUk3OUFsSjc4UVFhS0Z0MU9xTHpLdFdFNUlOaXBiVFRRbmcw?=
 =?utf-8?B?QVp3c24yTDRzdjdLVDA0SXpOOHpnK09Hb0p1RVFvQ1piRUdTd3lKZG5DN1Rr?=
 =?utf-8?B?UlN6eklqQkhBNGtubTBmYVU1QmZUTEUvWU1naHVXM2wyc1VoN1FRaDdsQVp4?=
 =?utf-8?B?cHJZTWowNU1hdGY5SmUrWG9seFNsb3M2OG9nTG90UHhvRjNDNUV0OEFlOGd5?=
 =?utf-8?B?MFY5R2xQUGNreWxWZXAxTVFIajZ1d3AvcG5JVFZtcXBvM2F4bFRIU1ZPU01w?=
 =?utf-8?B?V1pnWlFrcldRSGlaNzNKMG50d2N4Z01SQkVTVTI0b3lrN05HdXlPMUJDNnNN?=
 =?utf-8?B?WHRjM0dFQlR4c2drQ05rUGhBSHhKM1Y0WlVHSWtpTmVrRkpWUHVaVVBTZXE4?=
 =?utf-8?B?ZXVyOEVjWmEwZWxidEkrZW03WUtZRTcyMWRQUVA1UDRKNU0zeUN5MUtsUURo?=
 =?utf-8?B?a2xobGs4Wk5CaHlZVmMvNnZ6WXJWUS9tYW0wZ0tHeEZNZjZ6M01vVDBVK3hr?=
 =?utf-8?B?VEg2U2ZSQjhrczlmRmR5d0lzcXJrenFKc3pudEJjUFlnMGlER29Fb1NtQ3VF?=
 =?utf-8?B?VkZrOWNOdzdQcnJhTHBQZ0c0djZaRHJ2a3kzeC9xOGMxMlhrMzg4OEZPRU15?=
 =?utf-8?B?U04yUVRDeVhkamQ0WmcxY0NMZERIUWpsTk5ubWhnV2VXeTB3ME9jQjZtbys4?=
 =?utf-8?B?Z0dGbTVuUm5QWTZYa3J5THVoNmVKS0FUTW1MMHVsSHF2c0htRE9XQklEVUJz?=
 =?utf-8?B?eXhyR0h0V3cxTzdDNXpiYVZGN3luZ3ArUWordHR2cjNXRDliNnZ1blRDNy81?=
 =?utf-8?B?SGJGb3ZLUUY0YkR2Y0docnBaUlRBU3VFT1ppcHdWdnZxdzJKcyttZkZBU3d3?=
 =?utf-8?B?WlRlQzd5RWp6WHJpcnJqaTFWVnNrbHlqMGhZMS8rQ2Q3OXBWUDdVUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c3bd01fc-5ded-4691-5251-08de58fc65cb
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 14:50:19.6986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gqXvdiwc8ZH/roE+7/OwKno9tzkDJvUDeVWaEqC8PhfTI36pjHnm6fCK+9osfkU9b/1pQ/GSoiBlQxzWNALiLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB1872

On Wed Jan 21, 2026 at 7:23 AM GMT, Alexandre Courbot wrote:
> Add a macro for defining hardware register types with I/O accessors.
>
> Each register field is represented as a `Bounded` of the appropriate bit
> width, ensuring field values are never silently truncated.
>
> Fields can optionally be converted to/from custom types, either fallibly
> or infallibly.
>
> The address of registers can be direct, relative, or indexed, supporting
> most of the patterns in which registers are arranged.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/io.rs          |    1 +
>  rust/kernel/io/register.rs | 1198 ++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 1199 insertions(+)
>
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index a97eb44a9a87..eccaa176b6b9 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -11,6 +11,7 @@
> =20
>  pub mod mem;
>  pub mod poll;
> +pub mod register;
>  pub mod resource;
> =20
>  pub use resource::Resource;
> diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
> new file mode 100644
> index 000000000000..e414aebe4c86
> --- /dev/null
> +++ b/rust/kernel/io/register.rs
> @@ -0,0 +1,1198 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/// Defines a dedicated type for a register with an absolute offset, inc=
luding getter and setter
> +/// methods for its fields and methods to read and write it from an `Io`=
 region.
> +///
> +/// A register is essentially a [`bitfield!`] with I/O capabilities. The=
 syntax of the `register!`
> +/// macro reflects that fact, being essentially identical to that of [`b=
itfield!`] with the
> +/// addition of addressing information after the `@` token.
> +///
> +/// Example:
> +///
> +/// ```
> +/// use kernel::register;
> +///
> +/// register!(pub BOOT_0(u32) @ 0x00000100, "Basic revision information =
about the chip" {
> +///     7:4 major_revision, "Major revision of the chip";
> +///     3:0 minor_revision, "Minor revision of the chip";
> +/// });

The comment is inserted as doc comment, but it uses the string syntax.

I guess the idea is that you want write everything in a single line so you =
can
visually align the fields? I think it
looks fine on the fields, but the same-line documentation of the type itsel=
f
looks a bit off.

Something like this will definitely feel much more Rusty:

register!(
    /// Basic revision information about the chip.
    pub struct BOOT_0(u32) @ 0x00000100 {
        /// Major revision of the chip.
        major_version: [7:4],
        /// Minor revision of the chip.
        ///
        /// This would also allow you easily expand the documentation into
        /// multiple lines!
        ///
        /// Perhaps useful to document some quirks about the register!
        /// I know currently registers and their fields are very underdocum=
ented
        /// and they probably don't need multiple lines, but I hope that'll=
 not
        /// true in the future and we would have detailed docs in the drive=
r --
        /// in which case visually aligning becomes impossible anyway.
        minor_version: [3:0],
        //           ^~ closer to the variable syntax in Rust
        //             ^~ I keep the hi:lo syntax which I suppose is to ref=
lect Verilog.
    }
)

Another top-level question I have is whether we should define multiple regi=
sters
(perhaps all) in one macro invocation. That's the strategy of `tock-registe=
rs`
crate which is widely used in embedded Rust.

(Although, they use a completely different strategy in generating register
mapping; all registers are becoming fields in the same struct).

> +/// ```
> +///
> +/// This defines a `BOOT_0` type which can be read or written from offse=
t `0x100` of an `Io`
> +/// region. For instance, `minor_revision` is made of the 4 least signif=
icant bits of the
> +/// register. Each field can be accessed and modified using accessor
> +/// methods:
> +///
> +/// ```no_run
> +/// use kernel::register;
> +/// use kernel::num::Bounded;
> +///
> +/// # register!(pub BOOT_0(u32) @ 0x00000100, "Basic revision informatio=
n about the chip" {
> +/// #     7:4 major_revision, "Major revision of the chip";
> +/// #     3:0 minor_revision, "Minor revision of the chip";
> +/// # });
> +/// # fn test(bar: &kernel::io::Io) {
> +/// // Read from the register's defined offset (0x100).
> +/// let boot0 =3D BOOT_0::read(&bar);
> +/// pr_info!("chip revision: {}.{}", boot0.major_revision().get(), boot0=
.minor_revision().get());
> +///
> +/// // Update some fields and write the value back.
> +/// boot0
> +///     .set_major_revision(Bounded::<u32, _>::new::<3>())
> +///     .set_minor_revision(Bounded::<u32, _>::new::<10>())

This looks very verbose...

> +///     .write(&bar);
> +///
> +/// // Or, just read and update the register in a single step:
> +/// BOOT_0::update(&bar, |r| r
> +///     .set_major_revision(Bounded::<u32, _>::new::<3>())
> +///     .set_minor_revision(Bounded::<u32, _>::new::<10>())
> +/// );
> +/// # }
> +/// ```
> +///
> +/// The documentation strings are optional. If present, they will be add=
ed to the type's
> +/// definition, or the field getter and setter methods they are attached=
 to.
> +///
> +/// Attributes can be applied to the generated struct. The `#[allow(non_=
camel_case_types)]`
> +/// attribute is automatically added since register names typically use =
SCREAMING_CASE:
> +///
> +/// ```
> +/// use kernel::register;
> +///
> +/// register! {
> +///     pub STATUS(u32) @ 0x00000000, "Status register" {
> +///         0:0 ready, "Device ready flag";
> +///     }
> +/// }
> +/// ```
> +///
> +/// It is also possible to create an alias register by using the `=3D> A=
LIAS` syntax. This is useful
> +/// for cases where a register's interpretation depends on the context:
> +///
> +/// ```
> +/// use kernel::register;
> +///
> +/// register!(pub SCRATCH(u32) @ 0x00000200, "Scratch register" {
> +///     31:0 value, "Raw value";
> +/// });
> +///
> +/// register!(pub SCRATCH_BOOT_STATUS(u32) =3D> SCRATCH, "Boot status of=
 the firmware" {

How about "as"?

register!(pub SCRATCH_BOOT_STATUS(u32) as SCRATCH);

> +///     0:0 completed, "Whether the firmware has completed booting";
> +/// });
> +/// ```
> +///
> +/// In this example, `SCRATCH_BOOT_STATUS` uses the same I/O address as =
`SCRATCH`, while also
> +/// providing its own `completed` field.
> +///
> +/// ## Relative registers
> +///
> +/// A register can be defined as being accessible from a fixed offset of=
 a provided base. For
> +/// instance, imagine the following I/O space:
> +///
> +/// ```text
> +///           +-----------------------------+
> +///           |             ...             |
> +///           |                             |
> +///  0x100--->+------------CPU0-------------+
> +///           |                             |
> +///  0x110--->+-----------------------------+
> +///           |           CPU_CTL           |
> +///           +-----------------------------+
> +///           |             ...             |
> +///           |                             |
> +///           |                             |
> +///  0x200--->+------------CPU1-------------+
> +///           |                             |
> +///  0x210--->+-----------------------------+
> +///           |           CPU_CTL           |
> +///           +-----------------------------+
> +///           |             ...             |
> +///           +-----------------------------+
> +/// ```
> +///
> +/// `CPU0` and `CPU1` both have a `CPU_CTL` register that starts at offs=
et `0x10` of their I/O
> +/// space segment. Since both instances of `CPU_CTL` share the same layo=
ut, we don't want to define
> +/// them twice and would prefer a way to select which one to use from a =
single definition
> +///
> +/// This can be done using the `Base[Offset]` syntax when specifying the=
 register's address.
> +///
> +/// `Base` is an arbitrary type (typically a ZST) to be used as a generi=
c parameter of the
> +/// [`RegisterBase`] trait to provide the base as a constant, i.e. each =
type providing a base for
> +/// this register needs to implement `RegisterBase<Base>`. Here is the a=
bove example translated
> +/// into code:
> +///
> +/// ```no_run
> +/// use kernel::register;
> +/// use kernel::io::register::RegisterBase;
> +///
> +/// // Type used to identify the base.
> +/// pub struct CpuCtlBase;
> +///
> +/// // ZST describing `CPU0`.
> +/// struct Cpu0;
> +/// impl RegisterBase<CpuCtlBase> for Cpu0 {
> +///     const BASE: usize =3D 0x100;
> +/// }
> +/// // Singleton of `CPU0` used to identify it.
> +/// const CPU0: Cpu0 =3D Cpu0;
> +///
> +/// // ZST describing `CPU1`.
> +/// struct Cpu1;
> +/// impl RegisterBase<CpuCtlBase> for Cpu1 {
> +///     const BASE: usize =3D 0x200;
> +/// }
> +/// // Singleton of `CPU1` used to identify it.
> +/// const CPU1: Cpu1 =3D Cpu1;
> +///
> +/// # fn test(bar: &kernel::io::Io) {
> +/// // This makes `CPU_CTL` accessible from all implementors of `Registe=
rBase<CpuCtlBase>`.
> +/// register!(pub CPU_CTL(u32) @ CpuCtlBase[0x10], "CPU core control" {

Maybe `CpuCtlBase + 0x10`? I think this means the offset is going to be dif=
fer
by 0x10, not that it's going to be the 17th register?

> +///     0:0 start, "Start the CPU core";
> +/// });
> +///
> +/// // The `read`, `write` and `update` methods of relative registers ta=
ke an extra `base` argument
> +/// // that is used to resolve its final address by adding its `BASE` to=
 the offset of the
> +/// // register.
> +///
> +/// // Start `CPU0`.
> +/// CPU_CTL::update(&bar, &CPU0, |r| r.set_start(true));
> +///
> +/// // Start `CPU1`.
> +/// CPU_CTL::update(&bar, &CPU1, |r| r.set_start(true));
> +///
> +/// // Aliases can also be defined for relative register.
> +/// register!(pub CPU_CTL_ALIAS(u32) =3D> CpuCtlBase[CPU_CTL], "Alias to=
 CPU core control" {
> +///     1:1 alias_start, "Start the aliased CPU core";
> +/// });
> +///
> +/// // Start the aliased `CPU0`.
> +/// CPU_CTL_ALIAS::update(&bar, &CPU0, |r| r.set_alias_start(true));
> +/// # }
> +/// ```
> +///
> +/// ## Arrays of registers
> +///
> +/// Some I/O areas contain consecutive values that can be interpreted in=
 the same way. These areas
> +/// can be defined as an array of identical registers, allowing them to =
be accessed by index with
> +/// compile-time or runtime bound checking. Simply define their address =
as `Address[Size]`, and add
> +/// an `idx` parameter to their `read`, `write` and `update` methods:
> +///
> +/// ```no_run
> +/// use kernel::register;
> +///
> +/// # fn no_run(bar: &kernel::io::Io) -> Result<(), Error> {
> +/// # fn get_scratch_idx() -> usize {
> +/// #   0x15
> +/// # }
> +/// // Array of 64 consecutive registers with the same layout starting a=
t offset `0x80`.
> +/// register!(pub SCRATCH(u32) @ 0x00000080[64], "Scratch registers" {

This syntax is way to close to the base syntax above.

Perhaps `pub SCRATCH([u32; 64]) @ 0x00000080` would make more sense?

> +///     31:0 value;
> +/// });
> +///
> +/// // Read scratch register 0, i.e. I/O address `0x80`.
> +/// let scratch_0 =3D SCRATCH::read(&bar, 0).value();
> +/// // Read scratch register 15, i.e. I/O address `0x80 + (15 * 4)`.
> +/// let scratch_15 =3D SCRATCH::read(&bar, 15).value();
> +///
> +/// // This is out of bounds and won't build.
> +/// // let scratch_128 =3D SCRATCH::read(&bar, 128).value();
> +///
> +/// // Runtime-obtained array index.
> +/// let scratch_idx =3D get_scratch_idx();
> +/// // Access on a runtime index returns an error if it is out-of-bounds=
.
> +/// let some_scratch =3D SCRATCH::try_read(&bar, scratch_idx)?.value();
> +///
> +/// // Alias to a particular register in an array.
> +/// // Here `SCRATCH[8]` is used to convey the firmware exit code.
> +/// register!(pub FIRMWARE_STATUS(u32) =3D> SCRATCH[8], "Firmware exit s=
tatus code" {
> +///     7:0 status;
> +/// });
> +///
> +/// let status =3D FIRMWARE_STATUS::read(&bar).status();
> +///
> +/// // Non-contiguous register arrays can be defined by adding a stride =
parameter.
> +/// // Here, each of the 16 registers of the array are separated by 8 by=
tes, meaning that the
> +/// // registers of the two declarations below are interleaved.
> +/// register!(pub SCRATCH_INTERLEAVED_0(u32) @ 0x000000c0[16 ; 8], "Scra=
tch registers bank 0" {
> +///     31:0 value;
> +/// });
> +/// register!(pub SCRATCH_INTERLEAVED_1(u32) @ 0x000000c4[16 ; 8], "Scra=
tch registers bank 1" {
> +///     31:0 value;
> +/// });
> +/// # Ok(())
> +/// # }
> +/// ```
> +///
> +/// ## Relative arrays of registers
> +///
> +/// Combining the two features described in the sections above, arrays o=
f registers accessible from
> +/// a base can also be defined:
> +///
> +/// ```no_run
> +/// use kernel::register;
> +/// use kernel::io::register::RegisterBase;
> +///
> +/// # fn no_run(bar: &kernel::io::Io) -> Result<(), Error> {
> +/// # fn get_scratch_idx() -> usize {
> +/// #   0x15
> +/// # }
> +/// // Type used as parameter of `RegisterBase` to specify the base.
> +/// pub struct CpuCtlBase;
> +///
> +/// // ZST describing `CPU0`.
> +/// struct Cpu0;
> +/// impl RegisterBase<CpuCtlBase> for Cpu0 {
> +///     const BASE: usize =3D 0x100;
> +/// }
> +/// // Singleton of `CPU0` used to identify it.
> +/// const CPU0: Cpu0 =3D Cpu0;
> +///
> +/// // ZST describing `CPU1`.
> +/// struct Cpu1;
> +/// impl RegisterBase<CpuCtlBase> for Cpu1 {
> +///     const BASE: usize =3D 0x200;
> +/// }
> +/// // Singleton of `CPU1` used to identify it.
> +/// const CPU1: Cpu1 =3D Cpu1;
> +///
> +/// // 64 per-cpu scratch registers, arranged as a contiguous array.
> +/// register!(pub CPU_SCRATCH(u32) @ CpuCtlBase[0x00000080[64]], "Per-CP=
U scratch registers" {

Ah... I don't like this.

> +///     31:0 value;
> +/// });
> +///
> +/// let cpu0_scratch_0 =3D CPU_SCRATCH::read(&bar, &Cpu0, 0).value();
> +/// let cpu1_scratch_15 =3D CPU_SCRATCH::read(&bar, &Cpu1, 15).value();
> +///
> +/// // This won't build.
> +/// // let cpu0_scratch_128 =3D CPU_SCRATCH::read(&bar, &Cpu0, 128).valu=
e();
> +///
> +/// // Runtime-obtained array index.
> +/// let scratch_idx =3D get_scratch_idx();
> +/// // Access on a runtime value returns an error if it is out-of-bounds=
.
> +/// let cpu0_some_scratch =3D CPU_SCRATCH::try_read(&bar, &Cpu0, scratch=
_idx)?.value();
> +///
> +/// // `SCRATCH[8]` is used to convey the firmware exit code.
> +/// register!(pub CPU_FIRMWARE_STATUS(u32) =3D> CpuCtlBase[CPU_SCRATCH[8=
]],
> +///     "Per-CPU firmware exit status code" {
> +///     7:0 status;
> +/// });
> +///
> +/// let cpu0_status =3D CPU_FIRMWARE_STATUS::read(&bar, &Cpu0).status();
> +///
> +/// // Non-contiguous register arrays can be defined by adding a stride =
parameter.
> +/// // Here, each of the 16 registers of the array are separated by 8 by=
tes, meaning that the
> +/// // registers of the two declarations below are interleaved.
> +/// register!(pub CPU_SCRATCH_INTERLEAVED_0(u32) @ CpuCtlBase[0x00000d00=
[16 ; 8]],

For striding, SystemRDL uses syntax like this:

    type name[len] @ addr +=3D stride;

which I think is better as this won't be confused with array length syntax =
in
Rust.

Crazy idea: is it possible to just use SystemRDL (maybe via a proc macro).

Best,
Gary

> +///     "Scratch registers bank 0" {
> +///     31:0 value;
> +/// });
> +/// register!(pub CPU_SCRATCH_INTERLEAVED_1(u32) @ CpuCtlBase[0x00000d04=
[16 ; 8]],
> +///     "Scratch registers bank 1" {
> +///     31:0 value;
> +/// });
> +/// # Ok(())
> +/// # }
> +/// ```
> +/// [`bitfield!`]: crate::bitfield!

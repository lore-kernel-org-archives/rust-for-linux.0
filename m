Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020121.outbound.protection.outlook.com [52.101.196.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A5F392C3C;
	Tue, 23 Jun 2026 20:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782245176; cv=fail; b=sKKmXVEPAnD9eVhllaxVXXkzV+HnstK8CSdEeDVomR6XXYAGItULI2x5wRM0KilgiWgX6gGTHt/bjLhruyi+zhrWf/a8OOTU9auAZORiIa9vn6SqASfZMZY2ZIMlBx5CkVYs6+yZnuprSHcJI6OSz1S6yqbyrN/txijNrQ9iCh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782245176; c=relaxed/simple;
	bh=z18tQiXN+TV9QS07bj/cQ8HfzvjJrgI3Qy7iCrYDYaY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=deiyr+JGNfmiRDuojkj4gBGGcTF4SUont7nxtoxadtvkMVcG3lHjT5lZHQUe/vJteaUJLbTsT75TI3S+AbxnqRxXUGh6zB5Ti0oOwo2DnWGZPvP3JAbY53LBPj6vpvwYRYSe9RlYoXAIuTV9IYIWU71z8Rb7DMhqwJu8fJSZB2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=vP3/o9g5; arc=fail smtp.client-ip=52.101.196.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="vP3/o9g5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRhBwz31q9LX4rFWl+VJV/KBrMnRyV1DciLCFd3fUO8MEpymI04xFlLmZY3QP4uvzoGMK49LFBgNhQsEQHFb+gzOjD53AIwGtW7ZxwzyPynNUBSBvZ6nSn8UFH8DW7g28YP/MNGKqWgpSH5rhxuOdzBi/YZ6ShqsJ8BnoGWWEs2+rASL01KeI+DaQ8b0AuHbHVtDhogsgeWH0sQ9cj3VbvmJQZnyN7Xl9UFdd0yppaqjcVxAsI9J1K3I/3g2Wy9OiEex9vviVZukJIDCyfHQBjmyFHWohVbNOeXQkYJwzI7OhMsTSqP5BA3ft0kOprzF41pcIsZYWg2k0dPABEk87A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EgvtKMfMhZz3t/mYrZ+0ianCsE0AYe263i+Rk+xKgxk=;
 b=LgGlddS+ORIryfX5vi4xmz/Yfr0iROYcNBq3pd/MJb4Zur4ac9avhPoYzb4YMOrSdFqR3SYNkI5VVZ/v6rQp3PMDi4t2GCKnicRILd5is3DT/5d/AUSHVwspYvtxSkVgHvtDxiE74kJQwESELUNeLpYg6dxcSp0MVkxLeiYjKjrkdsYZXHcMQLR/ZsmkCEmJrL+0SjsZ1kYzoHxji9KrtjTqbqFLBhJZDzYN5KUOsFc1JTKx+WExkxItxzpZEnpHZnItoaylCNnak1XRhR1hw4k7jTYU6XbHfa0OV/On3f7SyakieE40ubQB4uUszeN66ZxiDbGkoiliYVVmvtDl1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgvtKMfMhZz3t/mYrZ+0ianCsE0AYe263i+Rk+xKgxk=;
 b=vP3/o9g5V/co9tqi4kHHXWrpIsEIQ75sUUht/J2xQWCUZU7xXEChPZvzFOtSTNivPnHRJOzjKjwm05wgLJKWs0Dnvdd/bxwjMWETcdKgzjXjd5uGbDziR2Y+RKr75XDuaJS7A5GMsGJOpmXU82wDOCs/bDBRWXO2nCmXNILR8Qo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB3006.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:178::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 20:06:11 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0139.020; Tue, 23 Jun 2026
 20:06:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jun 2026 21:06:10 +0100
Message-Id: <DJGP6OGFKUQ6.VXN0X7O5043E@garyguo.net>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Carlos Llamas" <cmllamas@google.com>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Benno Lossin"
 <lossin@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Danilo Krummrich" <dakr@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, "Lyude Paul" <lyude@redhat.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>, "Trevor Gross"
 <tmgross@umich.edu>, "Waiman Long" <longman@redhat.com>, "Will Deacon"
 <will@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 3/5] rust: add pr_*_ratelimit! macros for printing
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Gary Guo"
 <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
 <20260623-pr-ratelimited-v1-3-cc922f544dc0@google.com>
 <DJGJURFV9NCB.25MLPQBQTL9WR@garyguo.net>
 <CANiq72k8CApLuZsNqX6+A62=YfHn1uo5CDupZ2s1tViYhhMv6g@mail.gmail.com>
In-Reply-To: <CANiq72k8CApLuZsNqX6+A62=YfHn1uo5CDupZ2s1tViYhhMv6g@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0193.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB3006:EE_
X-MS-Office365-Filtering-Correlation-Id: 040782a8-6f0f-4320-2b61-08ded162df0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|7416014|376014|1800799024|23010399003|18002099003|22082099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	6M3tdEbAremfslYTeGza1Q/Oft9l0f/H0hceMah8u1RXTf58R9MEjuCQXslnUZC9QH7T4Tn3/teOAwECt9JIgcPhCWlc+RgrhnUWT9kK/Iqy8peQVsmyZ7BToK6iqTPWeWh+hIy1IA1B0G1kflaawLtyF01j9y8yuRG/Z+EM0OLeynNkbeHZqwS7N7VEusZYMOkeWR54CgJ2zubWzLbc9JORfHUQoFiECIBuHv9zJwEn6OR5NQmKjwR3uda5tKUmaY/dVJw3A7H/F2zeZqZH7Fs9WC3Cx11XjkraCIMx2UwWyzhD2HgNtE7Xoz5ApR86nCAdA7QJPj3Kcr7sheGThTNlxrmTrczU+DMrYId2UVaRKdXBXshZKbk2onaMw1aC16yGjGUNO//YbnM948d+VVkr2wCEXcGjJ/WZV+d3potJtaHWQySEv94H3HGOfbWEbChZMCMzX87Ptd7ulzq/TuQ61GfA3FZqL4jjUhQNCck/QuhzzHSxMeEjxY/VUBT2eOGcIy/EGkL0VFdSUMq2e8cEk/r8ik8jnWCunGekKkMHBbbwVd4K29EDd0vayS3L48+FQvTeHJwr8XnIalDlhT1LTYGTk7d0CMgvCCu0Vthkp6KGs7yhQ2ndXyeR2JtdZwjN8izax01kzFNYoWrhuEPs5khsw/83635xkjW8nIw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(7416014)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFZQZmZPeENNMTBEb3dDbkhoT3hLdElkOFMvVXVKc1REODNWU1FwSFJIdUlV?=
 =?utf-8?B?SS9iZzVzcnQvM1h5dnhDcENVVHI0SFpOSlhkU0ticFhkM3dBd3p3R2RhNGxD?=
 =?utf-8?B?bVRuQzhlTlZHM2lDTEZkOW0wZjlwZDZocHhKUU9mNEpzSzBWTXdSSzk2N1d0?=
 =?utf-8?B?TmJqVms0eWhHeWRzb2tWUHBST1BjNDlSdDNmRFN0RUFDOG9pdjg2aUNiSm0w?=
 =?utf-8?B?WVBCYnhMcjBpS2lFZDJnVkxJQzQ3ZFNCb3V2cUlTbUxBak5HMHZ0Y0k3WXQx?=
 =?utf-8?B?NnVVZzhhQVF6L2c5d2lzWkRnS2RZMDRINEo2aWEzYkpKWXZCS0tpSDNiVWUr?=
 =?utf-8?B?Z3F4S21NZDV4QVY0Sm42akdKd200bGJTamo2d2FOclc1UFpaajEwZzRuNG1C?=
 =?utf-8?B?TzFNN3l0eW5sT3pJYVdCRllmWEVpZk5UaWphclB6WjVlRzdiWGFFMEs1RTZS?=
 =?utf-8?B?UTZKc3F1OHFKcUM3L05FQnYwNDJwOG9lYUtpS1FDKzdFT0RaU1RMZXhxV0di?=
 =?utf-8?B?bVhqdHUxZyt4UHYwQlpkbG9HRXhSM1l4NXNML09JL29TWEVFWG1MUGs1eWdS?=
 =?utf-8?B?Wk5mNllDZjA5czNvMm9JZld6YWJiZW5pVTVyUDBTWkY0Tk9EMXUwVFBTakgx?=
 =?utf-8?B?TkN0YWI3cGJzWVhKcWlSZzFGZmljQkVoTEZqZkpCS1Y3a2k5SGJMV3BMcUpi?=
 =?utf-8?B?SUQzRXcvb25DZGlnZ1dlWGRhU29xVWtjWDdLK3dRTjdMOUU2d2tiTWxpN1Er?=
 =?utf-8?B?YTZNWTA4cUVqQWxZSzJOdG1RdlI3bFd6dEdFWm8rdlhyeDZONHVHN1dZU1d2?=
 =?utf-8?B?QllWRHowWkNnSHh4NU0xMytXclRQRXJRa0FOcG1tMmRmbVp1VUZaZ2ltLzYz?=
 =?utf-8?B?bE8rL0Q1U2pTZ3NKUHVNTm5uTDM2N3dqam16Q2R1NUxKbFNZMzNwZkVoL1FM?=
 =?utf-8?B?ZW82bHJUQjN5NExWTW9PMmdSZkdBQjZsQTJuamtOYVV0bXRsT0VoemxMcDg5?=
 =?utf-8?B?czVDUFFDZDkxaTVYazNuYlNVaW5udE1SK25VNEtRV1hDK3pwVmNLcU5CSUsv?=
 =?utf-8?B?RCtlVlBBL2JibnNkVHlIWTEwSFpWbTdYdnpRUHVwMDlUSGpmaEtUNmlMWENP?=
 =?utf-8?B?KzlTMy9RT1JTUlRhaDNROEVtUWNvVEdzK1QrU1hPejY1MEJpbDlrL0JBSVJB?=
 =?utf-8?B?VG9rNU9pVmY3YnB0Mzg5MC9UTmpaczZWdjRlZ0kwTVJ2a1dHSURRcG9EMHFH?=
 =?utf-8?B?VkJSbGFHUVNXbWhETGEyb1BMblVlOFBzUmVDWTlIZjVFWHp5MFpRaDV4M3ZE?=
 =?utf-8?B?TjBVRDVmZmE1eTFGejY1LzZNY1o2Q3E3bEt0R2pXc21vendyNVMyaEJnRUxl?=
 =?utf-8?B?dFlsTmlISGhxRUQvbE1PcEdXRnBWTUJHYjBLK1o0RnVJQVBCNTIyb2h2R0dk?=
 =?utf-8?B?NXQyQUFJeTh4ZDVnbFFjZE5aUUhadlo2V2ZCYW9NTlBWaEV0SUxJWEJxZG1O?=
 =?utf-8?B?bWlVcVRlV21KMFJ5M2xtYmUwQTdJMXYrUnlXelRlVXc4VFEwZTcwaGhNNmw5?=
 =?utf-8?B?VzZMbWtXR1MzRllWWHJNcGdPdm9VSlEvUko5bGloYlN6Q2w3ZzdQb3NDRnFK?=
 =?utf-8?B?dGpKVVh2RTQ5ZGhLRjcrdHVrbDRQYjRJTHY1c2pvOHlobkNTZXBnWWI4d3ZT?=
 =?utf-8?B?eUcwdWlGa29vVUplRnNmOHQ5TVlGVXFJbElvK2xwQnpPdDBJOSsyQWdZSktS?=
 =?utf-8?B?TmNZSEMyODJuVFZoeUo3bTR4NHBrTXlmcENBdTVsbUdSc01TcGNqN3JPSU9z?=
 =?utf-8?B?VEh5Q25DbmVBbUFWSE9hdFozVlQ5UDFQVDhIKytpWnBHd3pneGg1eEFjaFNo?=
 =?utf-8?B?QW80am5LYXZwZDZFOVlwT3RVTkNKRFZ6aDNUNDgvUGt4ekZZN0l1eDMwMDFF?=
 =?utf-8?B?UWJ0ZElKNjFXQ1d2dmVjemw1S0hObWsyMFl6d25zMWx3bkxUTVF2YklERFNt?=
 =?utf-8?B?RldjN2hRZy9YQzZpUVpGdUtPZTRhUVA0bFd4Tzg2aFdzNDNIWXo2ZEhtbHcv?=
 =?utf-8?B?SGFoNkh4amRsZzhkS0ZlQkN5dGlxM0VDZlpGL0tzckRPRDNNcTVmQndudW1Z?=
 =?utf-8?B?Zjl1R0IxRGZ3SlBSR3pOdWU2WnpNV1RNM095dE1ncGdaOTBGQUMvWkZpOWcx?=
 =?utf-8?B?WC9peE5PMDhWVHNzUGQwZDhxOTJsUWt6cUovWDVCYXBoeWVZMDdHUFJSRkhV?=
 =?utf-8?B?UkhrQmRvamROWFdWK2RwWWZUbUQ3b0pvVjZSRUNKQkpSNkw0RVdsNE9zV3pO?=
 =?utf-8?B?YVFnanZ5VUtnUkIvMENxbjE2SVpybEMwWVdzVlptR2RGVTZ5Q2R6QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 040782a8-6f0f-4320-2b61-08ded162df0f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 20:06:11.3258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ukXsQaLV/O/28THYkU0p9HelrIRxO3TCCCxjruP2Zf2+hQpzT5PeuMG5UanYBm++vkYIGP1y4uaoUJPrYykmdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3006

On Tue Jun 23, 2026 at 8:53 PM BST, Miguel Ojeda wrote:
> On Tue, Jun 23, 2026 at 5:55=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote=
:
>>
>> I really want this to be just a variant of pr_, not a entire new family =
of
>> macros.
>
> I think both approaches are fine. Personally I would like a `pr!`
> macro, but I am not convinced the advantages are big enough to drop
> the similitude/familiarity with C.

The previous proposal that I have on merging pr_ and dev_ macros (and add
implicit newline) is arguably not similar, but I think

    pr_info_ratelimited(...)

is similar enough to both

    pr_info_ratelimited!(...)

and

    pr_info!(ratelimited, ...)

In C the second one is not doable due to expressivity limitation, but I thi=
nk
our Rust macros shouldn't be restricted to be as expressive as C :)

(Also, even if we don't merge pr_ and dev_ print macros, we could still try=
 to
unify the implementation so they share the same plumbing but different macr=
o
entrypoint)

Best,
Gary

>
> It may be the kind of proposal that is best discussed in Kangrejos,
> LPC or similar in order to convince enough people and move it
> forward... :)
>
> Cheers,
> Miguel



Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010057.outbound.protection.outlook.com [52.101.69.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48EE396585;
	Fri,  5 Jun 2026 11:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780659087; cv=fail; b=msaJhMszxo2vNScsvnysmfNII6UqT0edUewfLHrj6GEX6iNXzm0bI6CvQ386hv8VorEbun2bCdZsfOhJqbNqgZag4RAp/y/0Adrdo23mGXXA5a7iV/Ume8fS58QFZWA8VBmfrT69KgZNnluxUPcKvC9SAijwd17kaG3EpLFuj70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780659087; c=relaxed/simple;
	bh=IEkIKRL84xZ4nqQ9Otvlsn5FmfTdm+dmb9clDL3SXh0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IruQUcbRYrH363zUyVzE8oUmtd29RkgecQJsfJxHGeqRv5Ss4y5kfpycB7O/rXwiWJLTlQLDdDujDOMuQ6vDSkIBaN4Pxd7B7jQn7kumqJGlnEYIttLhPyRFZW/veYS0XJoBAzgi3wshPBP7ppildvzjetjfdDJnMwADXk2+DAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=YRgTtw+U; arc=fail smtp.client-ip=52.101.69.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b="YRgTtw+U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oy2xtCRsZsAjqyubXFVbLtq75Xd9RUzBoiQc7v5KPfSbFAnjpDDdALTxhIZGJpP1scywCUpM9sC9oXL3pfbnUu3iyXT+UQRB2CQLRjBezE6vxqmbXYzEO7S+kEQjbWKpSGLT90+BLdi4zNbnQ60tMyDZkP/KyLp1OIJy+6FS3eyOe7HapCA9eUjYahlekGniBpcUpWNyqC827rBU7tjTaUuSu1h8Rux6XKIjm8CZy4Ua2wD3TOa/+1aEC56xcI4G2J2MAERaoNxJNB6XvuC+Vs9WRHwpLkexNF9jtgMA/pTcIxheoBU39ZgeoDczn/lbOfGRTzTBCSVNbKJbC1aZng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Zz70y+qBfZKpkbShGV0qNFJEvuttAmw8ftaZl2binQ=;
 b=Zvhi0ad0PnfxhqcTyn52VW5vkFuBbxWwwDhuM5QQr8Q+j5HHK8FvNDrXrV/lmDhYJEpGaLJnWmLc7UwECMC7oIRvfHgPM8LI4qu0YPF3xLjcxHdH+WMM3GV836PwuP/PKqnxcgXgQIzCXWedVxGZR5LHcet8j4MXuMOnSgMgR7nazy/31q1LYm9fB4TSs4moVLDd2ReyJFIxBsWiUjaBzX1Xf1LNux77U9Z6wJPFALNRIB+irmt4KGt48GUjRpleLFs2PH4ZMYobFenMOnkE1SHKZwJlWUkoNh9LdJSbY3znLnjJnrdW59mRTY+Ulxus+tRVcNRYpoBDWERe9jH0eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Zz70y+qBfZKpkbShGV0qNFJEvuttAmw8ftaZl2binQ=;
 b=YRgTtw+Ulj+pvAKLWe6SpGbddwOGfmVt1HLjZU0FY0N/krSj/oEwhqmjVEovQAvBFPDUo7myvzHADgO4wCBu6FN32YQp2T3DUDoAkXd122i20WngiH/KIR/X2GqUsxK7/yN1kQP0o77OyqxcYdsjzvoWTybncaAahNE8XtKuWN0Rw4EWJAVSwPe22bhFuDhRfmTm+Riwoq0wZfAu/xH0EPwY9nqbFPCVZK7OgQTMbQrlTA5vj1iXr6diIr5OqpRXS5qeBzVkFfHHItadHRvkcNbInsC+UwIhAQ9OUSgQ+uhY07tF9YzDNzghxV6Tba+VkBqli16XOEQVRcffQ6FPpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by AS8P189MB2529.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:637::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 11:31:22 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%7]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 11:31:22 +0000
Message-ID: <39f11302-936b-48aa-b65d-85e984fe1afa@est.tech>
Date: Fri, 5 Jun 2026 13:31:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] binder: cap max_threads and reject duplicate looper
 entry
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, Brian Swetland <swetland@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@suse.de>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Yunseong Kim <ysk@kzalloc.com>
References: <20260603-b4-binder-hardening-v1-0-d0aae3556c9b@est.tech>
 <CAH5fLgh664qa63CBqWY1CVNkdMwJbOPNzzPawpm8Ctz4U219gw@mail.gmail.com>
 <0dd33a00-8fe9-49e1-a32f-565c4a312429@est.tech> <aiKc-4v4T4X4DKSL@google.com>
Content-Language: en-US
From: Yunseong Kim <yunseong.kim@est.tech>
In-Reply-To: <aiKc-4v4T4X4DKSL@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GV2PEPF000239A4.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::225) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|AS8P189MB2529:EE_
X-MS-Office365-Filtering-Correlation-Id: 20b6a118-e1b9-4bda-9d23-08dec2f5f836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|4143699003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	LWuWlTjT0juLQKYX/hLJMIqK1tUqHGgIjbNFk1Bg3Aw2LMHP+IGT/njwI5PBSjxxUS0pybjVk9NXdzOjUMs9B1DnuodCs3CSaR3cIcpmsOko5U/bbvUgqrjchDUzdbmB4glW6wBRE8SRgDiadWMertECcKP1TJYLYdFvnBZqBsGV647uvvFBmtzhWa+U/SEW9mLCJYUK3SuTB5eysvCDiJNZt/mJoYIhaw/1Ea+w08c44L7RFmkZtQmhyYdm46KccGrZsgnHEcJuIuugssC9R20DbVsVG1ahGMK/skMxyoUi+AnAEf0/XAfTEE0xWdc2dAd7P1QSwQjOpACtO8/GhuQp7lbzg80HDzeynybp5F2wAw5jY8M5QO9HzCUU/lCdF5zK39zX16f5C8kWpzNLxbKnkqUL+YdZ2Hovao7eNpBuKwwGF62zrl6y2UAcla9i+XVWJLWXqvxTNwhNLOduhRL2WQlJSpM3S/8J6hAfUS0GvZfJK1USYaWuRt5Z2XpfSdjNTNMKo5Fsq+Jav6mO3UATPhaLyS260l/106enXsmdoHWYPa6NAeiiGRGk7wy0VlEOm6sZP100K8K7mQ92T/cwuqByJX7gIVQ2Px4QOM/w32KRw8IyRDpKy9ckgU2YgfIrU0xMHJi8Q/jkPMnLuQM+Xkmsj9jl3t+RVnNvTN1YhjzvMWesPmIbNFr1mhqE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(4143699003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SU9MSE85eFlHalpqcEJIbkFqT0FqQkNrZXF4T25ycG4xYW1qZjg0T3lsZE04?=
 =?utf-8?B?UEUya3hyMGk0S0VlU0ZmaGJXclRPZUVTN2VzRkZPaDd4RjJCZHZROWVGek9Y?=
 =?utf-8?B?ZXY3TUdod0paMzFMMGZzL3phK1lyV2FQVWo0RG5ZS0Q4d1ppZVpwZ3Vjd3FM?=
 =?utf-8?B?ZnE2dlpWaFdPY2xCc3BtUmRzeVF3ck1YZ2NuSDE0bHk2Y0JEazVta1ZVZ1dS?=
 =?utf-8?B?WFJVd1NKL0pENmowSkdXNnRjbEpMbnNTY0xqUmZxVVBsalJ0VzlkRmc2UHBj?=
 =?utf-8?B?TklOSXBiSjVxSXBtWndXakVHQmtvSURBOFZJWW5CdVNIQnhGWTdBYWw2UFB0?=
 =?utf-8?B?b2IzbFBKeVdxdTA3Z2hSeTlRTUVnMmduanJXYlk2RkkvdnU1empWb3RLcEcy?=
 =?utf-8?B?M1Y3NTJqOUFHSDZpMlBwS01qYlYyYklpNVRyV2pFZFdPMzliVmZLU2VlbHJ6?=
 =?utf-8?B?VGc5WDVheTVqaHdtcXZnd25iK3U4REp0cUltUFJUeVoxdUlTQk5WUFFkeHNt?=
 =?utf-8?B?ZmNWNndaNzl3ajY1azUrM0QyNnFFSkZ3OWdRUEdqb3ZHU2pDcENTUEpRMDdD?=
 =?utf-8?B?aC94TU1QMDNaRzFMZjZkd3BXbmp3NGQ1dTBFbDkwUmZLVjdtTEZvaWE3Y1ZH?=
 =?utf-8?B?Vnk0c3lmTEJxVFBVbmdoU1RNQ211eVZXVU9yaldmQWpTVEN2TWpWVDR6WGI3?=
 =?utf-8?B?ZGxrV0ZIRU95Y2pUN1FUTDdLcHc1ZjA5aEczbE93R3RDSHk4QTAycFo2aGJu?=
 =?utf-8?B?ZDZvTktBMGFCZHFJcldPKzFxR1daelIwSElLQnMwcGN5NC9MUXdrYzIyT3NI?=
 =?utf-8?B?SUFrbGs1d1lQOXNydFlueG42OVg2K3pjTDNoL1NORVphbVo1Yk13YndPVTll?=
 =?utf-8?B?QXlwZXFMSHVhOTg3TmxBWWFtRU9jN0s3V1dUY2tnRDhaVVdpcmFQc1ArWjNF?=
 =?utf-8?B?VHhVQjFWay8ySWdBSFJHODJyanFVRlJuVzJva0FBMTVLRzJxYVdrSXBmdXRR?=
 =?utf-8?B?OGI0MUp5MVlKMXBOOWVMSjh2M1o1blBSbnV6SjZteTQ3NGlGVlhubkR4bHc5?=
 =?utf-8?B?c09aMCsvcVlsd0IyUXA4VGFJUjRTQlhoVVBwbWs4Mk41Mi9ZYnM4aXo2SE9N?=
 =?utf-8?B?K3Z5K25ibDI4eS82RkRuTmRzNDBzR1VUOFgrTWVwRm9sbzRiOVdFOUkwZm96?=
 =?utf-8?B?VFVnS01QSlJiOEROTWFoUDM0ZHNtSGxsTTc2WGQ4Z1hEVWZta1VHN0xRdXhY?=
 =?utf-8?B?bjhMOU5UMlIwR3ZOY0owVzMrMVlDUWt6cGkzSURHaTVjOHc1K3laMGE3NGEr?=
 =?utf-8?B?Z3BTZThxVUs0ekk0SWZjUzB3QVM1ay9JeUpHbEY4Y29CR3BrL2o0cDJ6RWc5?=
 =?utf-8?B?Ukt5bUlYT2toa1FPMEdSZ1IrM3hhOGhDVjBjVnZwRFlieUJ0S09yOG5pNDZy?=
 =?utf-8?B?TVFOZjBjWmpPMkpkdmV3V3dmenY3ZHkxL0FySEtRcnlQR01WVENpeXFXNm0x?=
 =?utf-8?B?NExpdmFrUGFsdk9neUltY3Bab0ptQWFpcFRhajBMQjRCSlhBRHA0WXJiK3R1?=
 =?utf-8?B?REl0a2NvK2Q3Z0dKaDFwWkJDMmVPWWs3T0tHY1lFVlFoTTJCeXBEbFl1dkpJ?=
 =?utf-8?B?d2FHTFFXMmRvSG54WUNGd3RGVkw5K1g1WDh4cFgybWtyZnljaWw1elVPSXJH?=
 =?utf-8?B?dys5OVpDcDVrS1ZIZWZxa1NDckNxN0FzZWRPVWF1Y3Btb1oybWk3Tkp2cmZV?=
 =?utf-8?B?dW84eitYUS8zY2ZNSG5jUjZaTjNPbmpmcDhkS2FZWjljRlROd0JJVlJFQnB1?=
 =?utf-8?B?UE9yOUhUbEFBVGdBMDdKTlZxc2RSVHV3UStScVFIdmY0NjVTeGlERGVmbWg4?=
 =?utf-8?B?MEdmYy85OWxWRFVuQ3h0MzJSZUtod0NOQTRLSHhkMXJxK2JsWWtkUFZvMWh1?=
 =?utf-8?B?dDEvQXo2enJGRjZvMlRqWjdRRE1ybTMrTzIzSDJsY2dvQjEzOXpkSzdxL1Jv?=
 =?utf-8?B?TFRYcnR4WGFzVUFzT0JVS254VWxySUVkWjU3QlQ2eHRYcCtZYnFtcW9ZOC83?=
 =?utf-8?B?NkhmMXFqc1laK1ZiK1hSbzdkTFdtY2VuTmpmcW03ZGtYU2F6NFI5NXVqUHNV?=
 =?utf-8?B?dmpoZVphMVpTWGh4YTFsK2habHFFWjdJQnBFUHJQcnIxZVJoVXZVeEVldHlW?=
 =?utf-8?B?SmlleVo1N2lFcWFhNGR2L1RUcitJSlNDSE0wR0l4ZjYzWXJIYnZYQVJ2OStq?=
 =?utf-8?B?ZG9EVTFLUUlhT1R0MDBSbTlVY3ZOdm9NUVJzbnFDOXViMHZ4OXkvKzVrcFBB?=
 =?utf-8?B?Snh4UVhpb1g4ZklsNFN4bUhwUTVaTFk2ajZkVHBzZkh6S1o0MUtKZz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b6a118-e1b9-4bda-9d23-08dec2f5f836
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 11:31:22.1691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pqCI5StwizRmNkaq545qZwrYPnTnPuBzK/jn+JLH8eP2XnhW/Mlt6I8YoFuuwh4qeocBH2Mljp4OqNNr1RsCiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2529

Hi Alice,

On 6/5/26 11:55, Alice Ryhl wrote:
> On Thu, Jun 04, 2026 at 10:27:19PM +0200, Yunseong Kim wrote:
>> Hi Alice,
>>
>> On 6/3/26 20:57, Alice Ryhl wrote:
>>> On Wed, Jun 3, 2026 at 8:02 PM Yunseong Kim <yunseong.kim@est.tech> wrote:
>>>
>>> My understanding is that the only thing BINDER_SET_MAX_THREADS does is
>>> cause the kernel to tell userspace "please spawn more threads" when
>>> all threads are in use and there are incoming transactions. I don't
>>> understand how it helps by pass ulimit. Did you try running your test
>>> with the Binder ioctl removed? I'd guess that if it passes now, it
>>> still passes with the Binder ioctl deleted.
>> You're right. I ran the test you suggested and confirmed there is no
>> bypass — RLIMIT_NPROC is enforced by copy_process() at clone() time,
>> regardless of binder's max_threads value:
>>
>> // Test: uid=65534, RLIMIT_NPROC=50, with and without SET_MAX_THREADS
>> [snip...]

>>
>> Identical. SET_MAX_THREADS has no effect on the thread creation limit.
>> My original PoC was flawed — it ran as root where RLIMIT_NPROC is not
>> enforced, making the binder ioctl irrelevant.
>>
>> I think accepting 0xFFFFFFFF for a thread pool size is arguably poor input
>> validation. no sane userspace would request 4 billion threads.
>>
>> Would a separate patch (without Fixes tag) that caps max_threads at a
>> reasonable upper bound be welcome, or is it not worth the churn? this is
>> hardening, not a security fix.
> 
> I don't think that's useful.

Understood.

This time, I was able to track the binder fs using my kcov-dataflow (arg/ret),
which was a useful PoC. This could be helpful for anyone who wants to trace
arg/ret data during Rust kernel development or testing. :)

> 
> Alice

Thanks again for the review!

Yunseong

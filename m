Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010025.outbound.protection.outlook.com [52.101.69.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D3F3DBD70;
	Thu,  4 Jun 2026 20:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780604848; cv=fail; b=RnoRlnUu8FkweN7zYi11AP+9Ga32qgdU/Z8eL0l5ihn2aTT68I/3bVQC9seUfkwSZ/DE8O2sO60+OR8Djr2lY9V1+0TG8Z+x72W+C5n8DKqQBKKGoAoaGAl3zyJabG1ZZiMiFQORsOOEzZimi/iS7w0bSufimaSQPPTl25EbJto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780604848; c=relaxed/simple;
	bh=x0XZ0Gd+KF9gq0JuilUU8+w9nuOeVokYj3xIHi1mIaY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JqUgOCu7qQXwq4CHkshbPeuaSCiWhOWrAGNjQa0ID51pvCBedq1YyFC2Jsy3GuWqMkt/QbNqv4gJ7gmKLnJvMeN6+gQkkBBKz5N+47QbjhG0uWgqR9ETSnGqQDYpOdTdcl5MFDD+s0R5BaCQmcWsk/qROSUB9lvdI/Xq9nNbysA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=esVw9yEC; arc=fail smtp.client-ip=52.101.69.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b="esVw9yEC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pN34cxiy3T/XO4UpsKKYGMYxMiNLOnfyQ6m4H8A3Edn8scQyXGudWVk6Hvj5HvJ9PGpTmRRxhDNcgqLzgDXMjWdUJF/nDwOhHy6zVdTy1BwB6ndMTIsYKeUW6LWFwbNFYzDxnKP2hoZKLmo/VmHgx1D5ujVzNd5mdlrA5zbfF/NBZt7lb9On1pM1HwrXcLc8bU657jrkcbrbPtqqTjSqhUSTzSTjfdbsRA7kqXDJ0bg9HKTtUPcnnkLLFbsOhGf1gGBQJSVLkDkUMt7ntrzLl8S8Eql8yO6iiRzAQzItRi1OZ2xw9jHpEZrC1Dqvszg+B6mzaLzlFMgk4l+Z1Ul6vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGT94bWzzEhrYNTyg7KpE9yvV06OYAOPUFNLaeyE0oM=;
 b=wVDmXbJjvbiuiHMeofMngF2FMNHw172GqUozpCVhDLBKWDmKYZdio2oeRLwBaGfyboiMeZnE9+tcrfeJ5bhsBb5ZzQKUODST+9B11o2jedvdEyDAddGtF1xKv5lvXFr3hymny7CgvP94EfeBHtHb0b/A5OImFBEXbfKwJCX4MAJqpbMy9nBryJcH2ar0Jtdyvh258KvEpYYnRSvzYkIpSIvzrGFtpK3A+9CKSMZa/XBicyfsIlPOEK0RE4nYtu8VsX2+GQkYiWruHLdSv+jcqmCa7YiC+M0dbx8c5JnYWUIgAoBtpcNDWvlwr5OjHMF4OJ5hroRzx6gcvTRacBgHwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGT94bWzzEhrYNTyg7KpE9yvV06OYAOPUFNLaeyE0oM=;
 b=esVw9yECem3kXnj6herFDHGhoFe04fy2EI/2uEO700UtSVzElNwJgsjJkUCm+GBWngDDCTrw22HGTUEIRjrsLPxIMFprhKpWTz30WeW7bAJ2SDQ3bN0LeoR61wbTqe89soYLAMrqmuTs5hqKq0ypnSB7axP4UnS7+wV+M3JTHx4/Iukai3RWM9b3UnQf50zf4DkXgc57rPLXWxgi96x6nMQ3XigKukoDkogXzVqI8Oor+V/8Xz9yew2WNQTZNZYMTFAUJqVveVtRgqNSYBfkgL/xm6U8LZ3dbXQYHKMTgzWndta7C4n+P1C8l3q29dGkjOnvjOg33P5hJTNczw4LIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by PR3P189MB0985.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:41::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 20:27:22 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%7]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 20:27:22 +0000
Message-ID: <0dd33a00-8fe9-49e1-a32f-565c4a312429@est.tech>
Date: Thu, 4 Jun 2026 22:27:19 +0200
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
Content-Language: en-US
From: Yunseong Kim <yunseong.kim@est.tech>
In-Reply-To: <CAH5fLgh664qa63CBqWY1CVNkdMwJbOPNzzPawpm8Ctz4U219gw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GV3PEPF0001DC49.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::2ee) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|PR3P189MB0985:EE_
X-MS-Office365-Filtering-Correlation-Id: d5a773a7-ef3c-4a35-fa3e-08dec277aec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003|22082099003|6133799003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	8zLuth5V/7GXb/TpDDzbjKb4HmeH8lphBRektJBBv2tfqdDmZMjKcRhCk3d1F1TynaRUKmnl190PvnuZz8VJkP9yIiDNVyL8q2/975a6q0ZwT9mY9zKbagGmsm8SD8ar+SSRsTx3KNmPGx9ujMe7zTl156ua+1/KEZeBmt9fYk4oHK9TX5JvbZ6GV+CRMwqubO2s/XuPheq5uT78EAbkYvxZMf8SaIsWBBt+8hjNUuVeZLEyCNCHBPAivbmRn/Q5lfE2Q1yj51wRwfOYvHYMVsWzBU+oJsmQDvcpsyHxTx9+XVj2q4og8s6SibqyCQSC1sZGQAxw/GDas588M+J0Z6Lv6aMPmakSi56s2tmA9kXz7RhRciUBXG+TmcQtFYrk4k5lingiBMJoLPmGYYZ+urS7jvx5frSRPQEnyjSYSxYoz0hlhlgldTHuq6NY3u5BUDPzxpBo5RwAoc7bclfbGGVOnF21uBNUjtYvpoljYQmNSOL+J1iaNMiUB11nopLC8oOHJE5sCQqcebwT4xlP2Hjpr/DPiF3aRo4Wk5T2evbYsxsHF/eyAr6YpVHddy4zT/OJziaK00VwfFMyQNVCrtC6CykornPD3hPngRdA5VHmtQtmJLbBitM8EvPqI5Xcrxt29uEXVrvwwFmzMRag2qm98fzeJXttWpW++NzifWf9X68VY4ZxIaW7HqwJAwgl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(22082099003)(6133799003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUhJNWFyazRjYjNWa29xbWNFYi92RDJJNEhpWjJ0eFIyUHBtSituYnh1dWUr?=
 =?utf-8?B?WVZKRFRRYlZvY2NlMUJqQVRjbFo2bkVDak9ldlJGSDVuSnUrYzVJYjdSSHFY?=
 =?utf-8?B?NWxmbmk5Y3U4OS9pN0JhSnlVOUdFaFdqd0N4VlFLc0VqQTBSZDk1VXdWdm92?=
 =?utf-8?B?eVc0cCtEZDV1MXdrNVFaRng3RXJOR3BtVE8yMDRRbXhpVWUxNVp6aWNYMnJr?=
 =?utf-8?B?cUtNL2NBeVU0THBRN1g5eVh0eFRTcmZVTkhwdjFCQ1ZmNjE3WkNqVDFtekxr?=
 =?utf-8?B?ZVVmb081ZGRHcDRscWFsdkkvc0dnejFsOEZKQlY0VUhFSEF1OGY2VUYvK0V3?=
 =?utf-8?B?SzZUZHk2N2FUMzlnQkxMejh6ZUFydnAyUmJYWithcURGR29DeXQzYy80bTI5?=
 =?utf-8?B?ZXFha3B0OHN5TTk0bTJKajh4QzBUU0NReGltc3FycUxwTzNtbHphSWNPbHda?=
 =?utf-8?B?TzZOVnJ3MGRHeVN2UDJGd3NremNOYk1jSFVvU0xkSGpFc2F5Y1gvSFFleFB1?=
 =?utf-8?B?YnNieGR1U3YvalQ4ODB2M2ZEckY5STZnaGY1dDBPaHg1d1hVZEdRZzMwUUcw?=
 =?utf-8?B?MzBYcXFrWWpHYWovZDBkVWFUeHV2ZjBNT3BiSlJyMXlaYit4RkdLOEk3OHlD?=
 =?utf-8?B?d05BcE5ZWHVNVGNFZjB0N0VnNDhBS1lUUFBkck40VWUzYXhabFQ4R1hjNHZn?=
 =?utf-8?B?OFdWM1hLbnpmUE4vS3k5VTJCZlZBaVdSUndLZkZXVmR2bFMrdFdMVE1sSDdJ?=
 =?utf-8?B?SkhFVURKbllJSm5DemtRWERqdlJjbGZUSmIrNHh0dU1OREFEelM0TGx5RStW?=
 =?utf-8?B?M2FwalN2Qjc0UCs4L2JhS21rUWVhZUcyZjVtTkF3dnRiWHRvOFh4TmlyS3Ny?=
 =?utf-8?B?YW1KRXVqd1NEdGtrd1NrZGJQeUxpdGYvTGlNbDlsYisxUWppNDFXSUJyb1o1?=
 =?utf-8?B?SGRDWDk3RzlTUmkyY1hSeE9pZ0JrdFJOSTQ4WFhUN09KS2QvZHhBWHJQaXI3?=
 =?utf-8?B?TVdkTWhPZ1piTE4zWUtYRHZ5dS81ZEkwblNyNHpRVzJKTjUrZ2Q0SGwxbDIw?=
 =?utf-8?B?S3J4Q29WN3VaTENzdW8rblF1Y3ZneDYra2F0d29EUkRFOElodzE4S0ErTXhB?=
 =?utf-8?B?T01jOHk4YmNHQWtXSlBUeGJZUUJvaE1pNHhBbHRqb3RXb1M0SmxTTlN1cXBE?=
 =?utf-8?B?WGh2TlFGUHhOMllRbGZBc3haMHNiU2lQbGVkMGZQa2dUWVNML2g3czJ2aHdN?=
 =?utf-8?B?Z24xdG9tRitvMHB2ZHFySE1ZaHhHMm1jR0J3MFI4UWJBZHlqWEpuK2NEODhO?=
 =?utf-8?B?TU1FNm0vQko4YkFIRVhMMFRjRFdBWjk0b1Fzd0xidE80TGpKYmM1QkRhV3cr?=
 =?utf-8?B?MmNPOENuS3ZPejM2eWowU005c05qTFQwWkZZVzUvVk1PbVRIanVDbnNITVFt?=
 =?utf-8?B?bngwN25jZFBDcDRKdXIxWlgzMzIwSTZ5elZpYklKMzhRWEpZdXE5L2hCc0dv?=
 =?utf-8?B?WWUrTUFjTGFnWUxwdDZuUEdUNFAvREpwSzNZaEo2SWJoMFVnSkU2WnorQ1VR?=
 =?utf-8?B?aEluK0FFMjE1Uk4rbCtkaUpxb2xnTFl5bmJhTmxteGRGNU8yTzJ6dXZMUFpT?=
 =?utf-8?B?ak9GYnVpbXhKQ0ZYRTQ2djVtYVZDeXhKbnhWcFFHMWZENzBkM2JzV2lHOWJn?=
 =?utf-8?B?ak5CRWQwTmRMalRaU3JkWlNxSzQ2MExyaGJlWDliNWZaQmhSVHFnbXRnWTg1?=
 =?utf-8?B?TEdaOVJLUm42MnJ1bC9RdTdkbVNBY3hnRlBRV2ZNZ2xYaGdCbUY4Njk3TnRK?=
 =?utf-8?B?MVF4VkhiTHhMb0ZwQUdQRml6RUMrYjZFSFVxRFIvVnhHbTVsT2h4alpuZ0lF?=
 =?utf-8?B?a1VzL0ZhVm51ZGJyTGpLZFJxRE4rWnVFMjJRMW56TkpMYk02Qnl3dkRhOEZr?=
 =?utf-8?B?V2dJUjM3M0ZOVUlqcEQrNTFNTHp3Wm1CNlhMeWtSTWpwUWY1T0FuUXUzSWxD?=
 =?utf-8?B?V3B6MGMzTVZiR1htNnk2N0FsYUFtc3JGejRVM1ZpdmxIQWd6WjdDdjd0dGRp?=
 =?utf-8?B?MjJkRlNjbkdrYkdwV0ZINXlQSXp2OW5mNWVRaW5YVjhPOTZOWDZuTC9sdVlz?=
 =?utf-8?B?d1FFZ2JwTjFWRWFndWt4cndWUmR2VThVZ001YkhXdEZZbnl1Vk5HNC8yd1pC?=
 =?utf-8?B?bHVTZFc5bXhkMWZyZVdkeE1HUXUyZnZ2dFZlL2FVWmNIOVJqWExSWEZqTHds?=
 =?utf-8?B?YmUvWlNDZXdybHZJK2JyV051c05sVUpCWUplS0VXMHMydHI5VERYdGtySUln?=
 =?utf-8?B?RXQ1NTFRSnR1d25aakRSMHplTWN5M3JSWjUxTERvd3M3TWZMcEh3Z3BrVXdh?=
 =?utf-8?Q?7lqu9ksFlI9DnuKqNE7V9EwkLKUFGX8f1stasbUKGUEoO?=
X-MS-Exchange-AntiSpam-MessageData-1: USTlR+4ORzBi6g==
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d5a773a7-ef3c-4a35-fa3e-08dec277aec3
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 20:27:22.4763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SnVYoxVS7+8iupCMFkepg7wtkDvgOO4hlUtXPWhZQXZX2RFz3pEmHwfBmTrynbZPOz/UMV2CzWg4rLYBQy4DNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB0985

Hi Alice,

On 6/3/26 20:57, Alice Ryhl wrote:
> On Wed, Jun 3, 2026 at 8:02 PM Yunseong Kim <yunseong.kim@est.tech> wrote:
>> [snip..]
> 
> So invoking BC_ENTER_LOOPER twice doesn't error and the second call is
> a no-op. What's the problem?
You're right — |= ENTERED when already ENTERED is idempotent at the
bit level. There's no corruption. I'll drop this patch.

>> --- ulimit bypass PoC (beyond_ulimit.c) ---
>>
>> /*
>>  * Demonstrates RLIMIT_NPROC bypass via binder.
>>  * With ulimit -u 50, creates 300 threads.
>>  * Build: gcc -static -pthread -o beyond_ulimit beyond_ulimit.c
>>  * Run:   ulimit -u 50; ./beyond_ulimit
>>  */
>>
>> struct binder_write_read {
>>     int64_t write_size, write_consumed;
>>     uint64_t write_buffer;
>>     int64_t read_size, read_consumed;
>>     uint64_t read_buffer;
>> };
>>
>> static void *binder_thread(void *arg)
>> {
>>     int fd = open("/dev/binderfs/binder", O_RDWR);
>>     if (fd < 0) fd = open("/dev/binder", O_RDWR);
>>     if (fd < 0) return NULL;
>>     mmap(NULL, 128*1024, PROT_READ, MAP_PRIVATE, fd, 0);
>>     uint32_t max = 0xFFFFFFFF;
>>     ioctl(fd, BINDER_SET_MAX_THREADS, &max);
>>     uint32_t cmd = BC_REGISTER_LOOPER;
>>     struct binder_write_read bwr = {
>>         .write_size = sizeof(cmd),
>>         .write_buffer = (uint64_t)(unsigned long)&cmd,
>>     };
>>     ioctl(fd, BINDER_WRITE_READ, &bwr);
>>     close(fd);
>>     return NULL;
>> }
>>
>> int main(void)
>> {
>>     printf("pid=%d uid=%d\n", getpid(), getuid());
>>     int created = 0;
>>     pthread_attr_t attr;
>>     pthread_attr_init(&attr);
>>     pthread_attr_setstacksize(&attr, 16384);
>>     for (int i = 0; i < 300; i++) {
>>         pthread_t t;
>>         if (pthread_create(&t, &attr, binder_thread, NULL)) break;
>>         pthread_detach(t);
>>         created++;
>>     }
>>     usleep(500000);
>>     printf("Threads created: %d (ulimit was 50)\n", created);
>>     if (created > 50)
>>         printf("VULNERABLE: RLIMIT_NPROC bypassed!\n");
>>     return 0;
>> }
> 
> My understanding is that the only thing BINDER_SET_MAX_THREADS does is
> cause the kernel to tell userspace "please spawn more threads" when
> all threads are in use and there are incoming transactions. I don't
> understand how it helps by pass ulimit. Did you try running your test
> with the Binder ioctl removed? I'd guess that if it passes now, it
> still passes with the Binder ioctl deleted.
You're right. I ran the test you suggested and confirmed there is no
bypass — RLIMIT_NPROC is enforced by copy_process() at clone() time,
regardless of binder's max_threads value:

// Test: uid=65534, RLIMIT_NPROC=50, with and without SET_MAX_THREADS
#define _GNU_SOURCE
#include <stdio.h>
#include <pthread.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/mount.h>
#include <sys/stat.h>
#include <sys/resource.h>
#include <stdint.h>
#include <linux/android/binder.h>

static void *thread_fn(void *arg) { pause(); return NULL; }

int main(int argc, char **argv)
{
    int use_binder = (argc > 1 && strcmp(argv[1], "binder") == 0);

    mkdir("/dev/binderfs", 0755);
    mount("binder", "/dev/binderfs", "binder", 0, NULL);
    chmod("/dev/binderfs/binder", 0666);

    struct rlimit rl = { .rlim_cur = 50, .rlim_max = 50 };
    setrlimit(RLIMIT_NPROC, &rl);
    setgid(65534);
    setuid(65534);

    if (use_binder) {
        int fd = open("/dev/binderfs/binder", O_RDWR);
        if (fd >= 0) {
            mmap(NULL, 128*1024, PROT_READ, MAP_PRIVATE, fd, 0);
            uint32_t max = 0xFFFFFFFF;
            ioctl(fd, BINDER_SET_MAX_THREADS, &max);
        }
    }

    int created = 0;
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    pthread_attr_setstacksize(&attr, 16384);
    for (int i = 0; i < 300; i++) {
        pthread_t t;
        if (pthread_create(&t, &attr, thread_fn, NULL)) break;
        pthread_detach(t);
        created++;
    }
    printf("[%s] uid=%d RLIMIT_NPROC=50 -> threads: %d\n",
           use_binder ? "WITH binder" : "NO binder", getuid(), created);
    return 0;
}

Result:

    [NO binder]   uid=65534 RLIMIT_NPROC=50 -> threads: 49
    [WITH binder] uid=65534 RLIMIT_NPROC=50 -> threads: 49

Identical. SET_MAX_THREADS has no effect on the thread creation limit.
My original PoC was flawed — it ran as root where RLIMIT_NPROC is not
enforced, making the binder ioctl irrelevant.

I think accepting 0xFFFFFFFF for a thread pool size is arguably poor input
validation. no sane userspace would request 4 billion threads.

Would a separate patch (without Fixes tag) that caps max_threads at a
reasonable upper bound be welcome, or is it not worth the churn? this is
hardening, not a security fix.

> Alice

Thanks again Alice for the careful review.

Kind regards,  
Yunseong

Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021107.outbound.protection.outlook.com [52.101.95.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0826360ECF
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 14:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785939327; cv=fail; b=uQHrFInsrdCPnHPKSv9/WyZaqmrpadg9Oj8FiqRWsV8U2qqoj9wisxcBK37G6xBtVhGkH5dK14pj9DfUdXGoJMASMk+0P0w7HlfrEC9l2TMoKW/4LInFjXjf9T3d1DOxPw/dr+4mvqey9YG//2gz9jtNCXvJdSWRZQK3HAFMX6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785939327; c=relaxed/simple;
	bh=gHplNsUfa2A/bF1pSAZir9uQSr+M0dOeRjMtVZ1/wyc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Wflx4Q7fh3yofP2+A+H3uVGnbP3ERp+SB+wIp9tfqUTnNjB+P/7pqVom1McLqWcYYN/jd54SYTprE4NWUcYoB+HqTR24DouwMbrx2i/7yVAkG7y805JTMjEq7HKBk3gexTuLHwi+O7yJs9r0AbgVdw+MssmwaukqiC2KSOk6DOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=PF3onlme; arc=fail smtp.client-ip=52.101.95.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="PF3onlme"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VUb1iHZkTBXNFpnQpGFp4RKKvSuU2KvT4rDY0rN8CZb52S5y6l8Q8VdQbFghUXGcwbQGKkNjwSQDe7qKlZgzSxuQb6jwEFuNB5Bw++/u+orBpmXUcPLpUy3qPd/62pGXuTqlvLh+Mpj37hw99j1CMrlI0ANuRf2dmBVJaK2ffLWMAfALTzj+0EDrtcjWf8g+9uUtNG+qI3DKW/iwu2+v8yAxALeu0iSDH1bIwKLpYB8PUQ53ZfG1lDjmENyVV81mIHJDXFN48FoXoxYyan3L6mFZQh3kSMyijhxkOqMCrvphuWpyq5zYiSGuoq1dWPNKQGJnpuE769BstH9NWUuqDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHplNsUfa2A/bF1pSAZir9uQSr+M0dOeRjMtVZ1/wyc=;
 b=lUGc5BV+n54Pg0MUfXGs9/PL7Je8dwRar/VxmpsoOrlbfMvTiXAm9DQ02O2LLb0/ZTKcqWAIZkjmM2WtBniO+D9XEQXXTGjd+T6SUiEH+j47scsjoUmdEtPlVh537icpsTH0I4Pzg7neI7kYk+JTvrUdJBfokyk65sGutpqb576YHa9jJlRnLROVhNWhNegrs1ON3bs+ZskmKIe4phBtvJ1fZkr7YMOa8aQiOjFhBjJxaMZ4ArJ4igO8ut7mc1VXfsHYBs5RfhBsliAn46VdF3cCLWQ5xpq3a4YosVflXOutvUL2d9SFsfnkoewWMxf+Jz2UN5qzPcj5ZWq7plSxMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHplNsUfa2A/bF1pSAZir9uQSr+M0dOeRjMtVZ1/wyc=;
 b=PF3onlmeq+apw5P+vt8wVQkXW4NDSehKWfwhGl7Mo1bUCAtlaSPvXAiPsAp4Smd96uglImoydD7LDnisYq/EfQNB2k5OOIFYyVnr5ojKSD6ziVYQj3f+6d30pXiB6BLOtBJJQ99jjULuLKZgA8Q90LskRxxm/RIdPtWYPyJVSIY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b4::24)
 by CW1P265MB7558.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:211::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Wed, 5 Aug
 2026 14:15:20 +0000
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a]) by LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a%4]) with mapi id 15.21.0270.017; Wed, 5 Aug 2026
 14:15:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Aug 2026 15:15:18 +0100
Message-Id: <DKH2NGL7W29L.2K5MVFFHP84JX@garyguo.net>
Cc: <aliceryhl@google.com>, <arve@android.com>, <boqun@kernel.org>,
 <brauner@kernel.org>, <cmllamas@google.com>, <gregkh@linuxfoundation.org>,
 <ojeda@kernel.org>, <tkjos@android.com>, <acourbot@nvidia.com>,
 <anna-maria@linutronix.de>, <bjorn3_gh@protonmail.com>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <frederic@kernel.org>,
 <jstultz@google.com>, <lossin@kernel.org>, <lyude@redhat.com>,
 <sboyd@kernel.org>, <tamird@kernel.org>, <tglx@kernel.org>,
 <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v4 0/7] rust: use Delta instead of raw jiffies for
 timeouts and delays
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "FUJITA Tomonori"
 <tomo@flapping.org>, <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260722214951.72941-1-tomo@flapping.org>
 <DKBXI6A044JX.3OXFT3R8DIK2K@garyguo.net>
 <FenzX1BbXwDwhxl2RJ8sf7OnFwsAi3prmxcHhYKtfyXwJ_l88xtj5rr-z8T90Dqj1Em0RGPwvxQNqlo0pl2e8A==@protonmail.internalid> <20260731.224825.536098581345512332.tomo@flapping.org> <87v79o7myg.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87v79o7myg.fsf@t14s.mail-host-address-is-not-set>
X-ClientProxiedBy: LO4P265CA0046.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::20) To LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4b4::24)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOZP265MB8551:EE_|CW1P265MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: 881d7e81-6445-45a4-f04a-08def2fbfb15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|10070799003|6133799003|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6GXKgjVCXE48KzOcmJTely4FuI/rOJnLl0tzf++wYJKc3wrUyviotx6Qfu/v53KYbH75aGH7+P77I2HFpAwO37QvPoKsl8SIQ8l7dY9Ug9njuU8NnHZy4SHWSzZsIDwCJIr2G41OrrEHMb3E/skTN+/nG/9+/eYHxa0yGYkctfJTWvmFWMTKCpDAgiX1VZL4dI+NZQBeOzMrub72y7A0ndgYn0AAy1HRhNrynllJ+8R/8Fa0DBQznEW29/OW3xJViNixKRGY+hZeP1eVOdOFV812mVO2G18QK4mjQ3V4eJPKw0q6Eb+qGRzpyw6uvhsoLExDcdKQtfRIVv4GDXQ2LHOk0gllhki1Qk+P6Cgt9nfwgrVum0SSPsShmi+BFqwhayboTqQlREUKyV15oJBagzdl+q53VDZpg6vKzfTiSAwub5wCoIFPX6twrVMwxWXoFGQBf/g2sKCRCHs5c/BsX+rVurR9+QAHCgbx6E6mVrSIUrUplBUxtUwI/SgIMQ1wgLal2UbBm3UIBb93ne/fKI2k/Uie/yE2iEbdgvh3ps8p9N0qZZAKKFALaX8MLGzlwbR97rDjpDxj+dzlUSes3cR4/M1oWMypQkzaqdJ6Ehn9ApCsy7IsgA/4hQt4GOYgUt/KPllS1bc3oWmOSUkFp/OWak84HIVZbI1hApgfRY4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(10070799003)(6133799003)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHJRVFFvOXlzemxlTitJSWpSaEk0R0tLejA2eGxsY2NFeUVLUDBzZFNxSXRS?=
 =?utf-8?B?SjVvS0ZOMDFRMERrcEM1WGZBMVNTdGRSUys3T2JteXErc3VXbXhkYU1Zam5J?=
 =?utf-8?B?ZFd5T1pOY2lFTFZqK2d3NmVESDVkWm51eUxqK0QxanI4Vm9OZVg2QWVYclZT?=
 =?utf-8?B?MzNFKzF1NGVpVFJiUzBDMktiUXQwQ25mUCtERkhhZU5laGpBS29mUWNkVkJL?=
 =?utf-8?B?Q1ZRSEVGWnFDU0tQODQzZkZHaHlBak1jRmwyMmRQblRPV3dXYzRDWnVnQUor?=
 =?utf-8?B?aWZSVnUwK2xyQU45SUhZZjU2OVJZM3E3R3JETjlTMzlvWE1McHAwa0RLY0Zs?=
 =?utf-8?B?SjdFU3cvaFJnWC80UGt4STRORzF3amhYSk9RYTAxSkZ5bnR3Lzg4NkFiaVZQ?=
 =?utf-8?B?T1J5L1FDNW56M3NKaGJEdjdFQWtGSmhZdnJCQzNQdkpRTGlRbVdLcUt1eXBo?=
 =?utf-8?B?WWk0Z3pTWE1lK3lvbGxmM2Q3VXdkQ1R6ZnFLV0I5M2FCNXkrdk1ueURnQTNO?=
 =?utf-8?B?R0RDbVh1cDhqVkRiL3ZVc0htN0hvdzh5c2M5L3JDVmFFRmdGZUpYOXFMQm1E?=
 =?utf-8?B?OTRNRUhJRXBLZ2psV0NhWmt3NzV1RDJVcktKY1k5ODZvUk9VTXk4NEJpMmZv?=
 =?utf-8?B?ZWsyUktBNk9qTDBDS3UyNEI5R1JyNThYSndoQldIb3l1cWFUUk9VQW1VWkpM?=
 =?utf-8?B?bWxEajBIZE1TZ1ZrUUJmQ1psK3NrekRtMXBWRm84Q3pNRlgzUzF5NDhDRHdv?=
 =?utf-8?B?aWNsT0JjNGJ6Njl0VVZnbFovTVNTa2ozbjBuRW5ndHFCdTJNMFdWdXpHSUpp?=
 =?utf-8?B?bmk0YXcwdmFFVTlkSVhCaWJ1R2k3TlFPTCt2elF0WkJLN2sxbTR1UW9weEJK?=
 =?utf-8?B?YTh2SGtXUzd1b0dOcm9oOTVQaFd1blIwblc4OFdEK0dQemp1TVJDeThYVUNR?=
 =?utf-8?B?dGxDNkc5WDd6cURLaUZhRnVTRXVhZjVsdDBRTWRFTVpBQjEzNTFLc3NjWEpN?=
 =?utf-8?B?VHFFbnVHcDdzRkZiSVNKUmFPbkFhWVhsUVV0V3lsYWVkNzhLTGtKZThyK0pp?=
 =?utf-8?B?R21JdWlLbm9Feko4dmNYaVRxZEJuN28zdGQ2ZkhGWVJiendCVWtJWXVweGVz?=
 =?utf-8?B?UFFReXQzNkhCbWFzei9RaVVMMG9sV3dMbEpUc0NNVTlTTTE4NithRTVhZFU5?=
 =?utf-8?B?T2YzUE9USGlMOGFONWdXNnhoelNqVjdydDBKaGF1Z21jR0VPR0kyV1p0VHNX?=
 =?utf-8?B?Y1ljTlNDNkRKcXJPWHZHbFZmbFNoQlh1eFlXU0VIRFU3eWluMDJrYUJuR1RK?=
 =?utf-8?B?NlVSZnFxbzI3MmRyRUg3RU1hZVFvVDIxQzFyU0FGdkxxUktydzAvdTRlTDE4?=
 =?utf-8?B?b2MyRG0zcXJEQTdXc0huUmJoeU92alFWM2ZYbjk3VFhadzlwWUxmZEFmQzJK?=
 =?utf-8?B?YTZ2bzlrSVg0Z011SmxwTk9QTnZZOFBmLy8zM2d5N0tNTlpFM1h3QmdSTE1W?=
 =?utf-8?B?eFVHenRDYkNKaVQyckYvTzZCTVZFTXlyTjVJWm1aUnhSWVcyL2NuOEZjZERW?=
 =?utf-8?B?cFV4aXFmcUY3R2diVGZmcXRXRHBNSCtkaGIreEJGdnZ0d0ZoTUs3N0h1UExK?=
 =?utf-8?B?ZUFwWFV0YkZSUTRNdGpWMVlzb2x6SU1iL2U4VTJxVmREODBsdHhYYlI5R2hN?=
 =?utf-8?B?c0dSS0d0TGsxZXhOZjFWYUxWNjFmSU5PSzgybk9uVFpnTE02UEZxdlNGR1Yr?=
 =?utf-8?B?OEtteFhDK2FaNlV1ZlQwYWRYaVkraHJPNnRvSm80ay9KWUdwVkZqbVQ0QkZK?=
 =?utf-8?B?bHhwRXFOYWRRYW54SlE2aDFTWjNHald5RUpnWmVJeFJHRzg0ZXFqVitOajRl?=
 =?utf-8?B?bE5UTFVHdUM1NVZTU2crcG9YMUk1WWROV1BTOWY3SzFiR2NKRkhCVEY0UExr?=
 =?utf-8?B?UlRoUHBwV25XK1p5aFBobTUyM1p5cjcyR3NoTmhCa2VsYTh0bDFpVmlXazkw?=
 =?utf-8?B?WERaNldZMWxEaUlaTnpENWM1dGx6ZENqczZHcVUyQVRsOVVBeHdqUzBseFhV?=
 =?utf-8?B?WnhZc0F1YWxxT2Y0UVAxcW5pbW5zVlNrNU9CK0dTb3JXM2RkZXdiemMxUytz?=
 =?utf-8?B?NDVETE5LS2ZPWTRXemxxaVFqWHV4QXZSdGs3NXdQNjNQZE43aVJacG5zL2g4?=
 =?utf-8?B?aEZQWGZPbzRkZk1yYzNqT3ZEcEJOSmdteGJhTjVDVElObGNuZWl4TjJmVkhP?=
 =?utf-8?B?d1ZYUWZkRUFHUE1uakgwbXIyRjhucE8rOVRXMjkxRGUzZFFzK3l1MUROT0Q4?=
 =?utf-8?B?L1lpQ29KOXhpN1RIUGhJNEMvcmJpeGtQSi9VTURQNUtPRWhJbmxmUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 881d7e81-6445-45a4-f04a-08def2fbfb15
X-MS-Exchange-CrossTenant-AuthSource: LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 14:15:19.8208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fRCN6ZzQxunXi6CdKR9l2G32bDBp0jXec8/qFE/ok5S9ekkpES64ts25gfw0EZPeehxmHLxkw4dFCwQPoqV4mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7558

On Wed Aug 5, 2026 at 1:48 PM BST, Andreas Hindborg wrote:
> "FUJITA Tomonori" <tomo@flapping.org> writes:
>
>> On Thu, 30 Jul 2026 14:09:59 +0100
>> "Gary Guo" <gary@garyguo.net> wrote:
>>
>>> On Wed Jul 22, 2026 at 10:49 PM BST, FUJITA Tomonori wrote:
>>>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>>>
>>>> CondVar::wait_interruptible_timeout() and Queue::enqueue_delayed() use
>>>> a raw jiffies count (a plain c_ulong alias with no type
>>>> safety). Callers have to know on their own that the value meant
>>>> jiffies and convert to/from it themselves, which is easy to get wrong
>>>> (e.g. passing a millisecond value where a jiffies value is expected).
>>>>
>>>> Both APIs just take a span of time so, they can use the Delta type
>>>> instead.
>>>>
>>>> This series makes Delta generic over its time unit with Nsec and Jiffy
>>>> types, switches CondVar and Queue to use Delta instead of raw jiffies
>>>> (updating binder's ioctl_freeze(), the only caller of
>>>> wait_interruptible_timeout()), and then removes the now-unused Jiffies
>>>> and Msecs type aliases.
>>>
>>> There are more jiffy users being added so we should take this sooner th=
an later:
>>> https://lore.kernel.org/rust-for-linux/20260726223613.1242940-1-dakr@ke=
rnel.org/#t
>>>
>>> Andreas, any plan on taking this via timekeeping-next? I suppose Boqun
>>> could also be taken via rust-sync tree if you give an ack?
>>
>> Agreed. Getting this into the next merge window would be great.
>
> I was on vacation, back now.
>
> Getting this in the merge window for v7.3 is probably a little tight. We
> should aim for v7.4.
>
> I will take closer look this week.

Ideally we can still take them this cycle so we can add users in the next o=
ne.
I suppose otherwise we might want a topic branch early next cycle.

I think if you can pick timekeeping patches today or tomorrow then they'll =
still
have a round or two in linux-next before rc7. Or perhaps Miguel can pick th=
ese
instead?

Best,
Gary


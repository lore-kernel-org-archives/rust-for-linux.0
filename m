Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022135.outbound.protection.outlook.com [52.101.96.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B59E47533D;
	Mon, 12 Oct 2026 12:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806550; cv=fail; b=ECIdXKUJB2teZyAnxMHqv9uQEme7CoapL7Ii/j2bP4zTqo5Y+sCs6ADTYByScMc9wO+QSK9cHMx3uOGx/Vy56Pj5P7FCoyjLzHgyLIHE9KEnaRG9JHxokUI2LpSYHWX2yDnKEAzb7lLyjN+EDYXBfIKRhmiKUV90kRtCaP97a5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806550; c=relaxed/simple;
	bh=nLoZxQmA2yiItgSbWSwwfP2PEdpchxv/URi2zTUXxnI=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=f4lcQe2CdGJq4K+bw8kybnnt5onD3xJMETdZJCVlKdy66Fp9c2ch8COedlF57zaaED8fErymI7BUx8qGVOQ54jWxuvTDtfRrmr8IF5LS5fzRhKAmcKAwK/CCaUhdNMdYcGje+08xNywJeEoqntKjKNjMqv5/hJloCD1MK0ypmAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Ta+qo1AQ; arc=fail smtp.client-ip=52.101.96.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Ta+qo1AQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mn5jI2qbclPzcD7P1Ffmx/phYUzle90FUh/aEXdXjUUEtrcO98kePqTH/utH6cuL7BjWNj+hhzp3w0mrOMtsgVhr4zmjw6U1RI8QPiloFo5uDUYEL+K6hikqN0jgZA6WChJmIAfNy90+JXSn5trzePDo9OIy/3Gb/Y/eACvdrmuG/TWWKqYHaPjgWKpyY6EhryyCE6Nxq0m9f0e1jiLbw9KnOTd8CFYp039sIVYhgJn5MMDNM7V5dI3witcQGjgxhwfiN49GNJEGTHdPgXivtMqhuxl0UXAz5r8EZG7A0HqZB3V4BHKEdtqg5FVKd2YvEWOAvztZ4ylI3/ryatq7bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBEl7VYMI3zE/CHDXQIjDgNmQPL0L1FM1CApIGq0OLQ=;
 b=hDYceCmI5Vb3p6c2taA0XNs+RzjppfIWiIqjEqtcUIVhK3qVgBhcsAmRMy50P42695Zo25N6pMSbtoZVTbJQp8BwYRECFnpTMfALBPZIzkYS1K6EMYhallD1gFGSI8ZYFId6VDIHOOmJYs7OngbTXRL+EObQbeghe7TM4zlas0ZAkVpZO7MO7tnziJp7J17UTfjGvwStsDORrRwL/OgkkzsnlK2+ZLeyTlfMjk1jYcvfVy5Nz8T1oR6xIWSFBUWdQ6m4QV1djgquHpnO788fvLyjx36SYloSt2N8ELPkzkdCjO6VOFEsfiToLcgpO72qwEO7OykEYJ/SSH844P4G/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBEl7VYMI3zE/CHDXQIjDgNmQPL0L1FM1CApIGq0OLQ=;
 b=Ta+qo1AQPuQMp9H5pF3VRY5wKWdWobeqTtnWkQ5do1wGR1wl5em/Cz/fr9KAePKI/ZpycHea04OCv4BXdudLOlVpvmUKl8tu0OcsBghhsamuuSsGfYsCiaih21Z48G/MqubaDEjyFUCMUjiVrUfJ3fKdVd8tDhw1GqOmABDPghg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b4::24)
 by LO4P265MB6667.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 12:02:24 +0000
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a]) by LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a%4]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 12:02:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 13:02:15 +0100
Message-Id: <DM2UEMVP195X.WA9QG4BY453P@garyguo.net>
Subject: Re: [PATCH v12 5/6] rust: ww_mutex: implement LockSet
From: "Gary Guo" <gary@garyguo.net>
To: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>
Cc: <lossin@kernel.org>, <lyude@redhat.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <dakr@kernel.org>, <peterz@infradead.org>, <mingo@redhat.com>,
 <will@kernel.org>, <longman@redhat.com>, <felipe_life@live.com>,
 <daniel@sedlak.dev>, <daniel.almeida@collabora.com>,
 <thomas.hellstrom@linux.intel.com>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <cover.1791799751.git.work@onurozkan.dev>
 <8a3e94391fcee2b7e95a1f93a43c98ba385940c0.1791799752.git.work@onurozkan.dev>
In-Reply-To: <8a3e94391fcee2b7e95a1f93a43c98ba385940c0.1791799752.git.work@onurozkan.dev>
X-ClientProxiedBy: DX1P273CA0006.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:21::11) To LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4b4::24)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOZP265MB8551:EE_|LO4P265MB6667:EE_
X-MS-Office365-Filtering-Correlation-Id: 37e4d02a-44e6-41df-3ae0-08df2858adc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|23010399003|4143699003|56012099006|18002099003|22082099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	PNwGAzOwDzl+u41p4MX83w8OjqauHct0Hq5dX3aXw0DFBC4JlaNIu2KHMvyeGNO4N0qGuepWVrjvbudQxNR4QZNlY4oaTfkZkSssNBB0k6jh23yEhN6ZfihF1bwitkyCRi/+RSTadkJDV/PAC1oQhwLOOg4RR+r1S41BsZMKjCXCcsKnb8gpxsB+2fuuTsxrEZM82lMVvPloQ4vB+pNq3VqqWoU88gD/0HgaZLxKBKLxI4DVgoTPBjB3EVvcYuTKmkIG1fddlJYEOStv2gE4Z5M2YjoooLj9OhKaboKFjxzdMKeTpTNhlfwDuXu4vpIpgGtyzdn2jxkwE4/HDF/Sd/fdt7A3HQaAaBzF3wPHIXroxcCe1sFmP2FB/mRffhURELit+DptwywweuuWxZkyyhQZVKmWGup+fWhh3b+/WFRTFUgfo1Ic91njpUKWPtqta3cWS4VdaCVf6aEO5s0VZ3aMmUlXvxwlAKpf27tsL2XpjsPbi9a7Y0sUdGEdW/f/pB9yW4raWeabn7FoDxYRqmyNSTqW6PkCzSkpX+lCD1/nq4Vy6t4W1tCE3aZ7RS+ChMAKzhF2mI2ONnF3DoD9DaPfJZfsr7Z8IHXI2Q18IE1e74ViuGYFQZmU87lG8glUG9PEPi00J9qWsQUzLIpenO8kGxN1EIqyWFba1rKKuxU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(23010399003)(4143699003)(56012099006)(18002099003)(22082099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmJSYWVmNHFLZXd2Z1JhRTAzSE1vZW10c25TeG80VE5ZYjZMSmtZM2RZdytz?=
 =?utf-8?B?K1ZDRzVpaGJ2ejIvWmhtakROMEZqTmRPS1hQTzVnUEdTa1BVREdvK1h3Z3ND?=
 =?utf-8?B?WW91MjdoL1YrZ0o5SkdaaGhFSGZZU2pXWWRNWWV4bXg2T3RNdURQTzRpNytJ?=
 =?utf-8?B?cnVSN21IVnhvYWdBT09EdVNKWi9XTm9zMkRjRHRsOEhHOHdvbmtCdkVma1FB?=
 =?utf-8?B?Sk5OU0p0VW9VUHNZQXRoQms4aTV4emRaU2ZscHJBdzZ5MHQzbTIrVTNGckZn?=
 =?utf-8?B?M0Q2T1VYcmE0WVU5aHJqWUdaY1c4dkd0aXBTRzZDZTJVWnFaelZ6bisxQ0NW?=
 =?utf-8?B?V2FiN1BCNkVkeTRVdGZpeGI2bXBxUnBMZTlpM3YrTTcxTmFJQW5xejVhczEv?=
 =?utf-8?B?ek9GNHU5eUNMdFRObGxwazRUZmhFVlFFVms2RXh4VldwZmszVzZyRGlEb2xY?=
 =?utf-8?B?Nmd5REVUSjhUdEVCYVArYkRCS2xqTjlTWWZBK0d5cGVLOUsxMVJGR3N6M2tC?=
 =?utf-8?B?WXl0RHFmVFRRSGxmTzd5S2YvaDBCTTVaZThoLzNMNUdCdHVYK0xyMGo5RU9k?=
 =?utf-8?B?ZGM4YUxoL2RzUEhGams3cER5WG5TMmFlQ1V6ckpWK0R6SGhLRXFBMGdYN0hu?=
 =?utf-8?B?NGpQOVlrQmJhaEpCeXFGcmVvUkVNeUxBbm5kSkpqUkN5ME9NNERjM0F1bTFw?=
 =?utf-8?B?MDFCd3RKandCc0J5ZFBKdTdSZlB3NWtZMjdoRDNnS3ZhcmxQek1DRDZtc3U3?=
 =?utf-8?B?aGpleVo3ay95NnBTNHB2ZnZjY3ZEbnJXQUJCV0dqUTRVYXkzY2c1b21ZMGxv?=
 =?utf-8?B?SEdXYTBtWEhUaGF2MUtGNHVxMGd3eThIRGs3ajF4MmZMdzYrN2ZWYXgyNlBP?=
 =?utf-8?B?MzArbnRFUG9yVFBUK1I1WFB5RVpXWGlHM0pOcm1RLzZwUUpCbHB4MUZ6TVlG?=
 =?utf-8?B?dmVTUDU2cVZYZmxRT20yaVFoclJmeUhZbGd2WmQ2cGcwdXNZZ0FLaEZaR2t3?=
 =?utf-8?B?ekRYdmVDT0JoMlE0V3lJUm4zM1JWaVdnRzVpMFZuTlczWmlkYnFDYjYwdTli?=
 =?utf-8?B?WGRZTTNDL0MrY085K3ZaS1ozdmxnVmVSZVVVSCtRUFJOQTJNUXhTMm1RcGJv?=
 =?utf-8?B?ZjdaWUtXdUlrQXE4VEllelAyNGh2djQyaExLR3hhU1dGMjhsSmhsdGtEQjFm?=
 =?utf-8?B?YWZ0bExlK1d5WWFDYnhTYWVaOHVmbCtjNjNGTS9WcXB2RHh1ZGg4Tlp0OHph?=
 =?utf-8?B?cTduOCs3a2IyeUorVHR3Y3d1ZEphakpFb2VXWGFpWGNQWGpWM2RoMkFSM3RH?=
 =?utf-8?B?dlhJUEMwWmFTWnAyT0pCbHRqbkpKSFBJM0tJRFJIYlU5YW1IcVdGSkU3T1VR?=
 =?utf-8?B?SHgvdmJ5UFR0U1VHRkFOSUZiZktxVmkyay80VHB0Y3QrWElFYWsxaWdBTENH?=
 =?utf-8?B?eCtNUmlab0xUb2RERUI3N2xZSEVBUVY3T3lSdnhGRWk0SFpMSVJxOERUM1lW?=
 =?utf-8?B?a0N1THN4OWFZNjRGdERxb3NXOXpTSnF3SUE1Zkh0ZThpZDEzZ1hYblhISkZK?=
 =?utf-8?B?YktZZ3JxZHRNWitVY3lRMENNQ2gzKzhSSHp3TDMrZEl1dU14RlJGanJBWHJy?=
 =?utf-8?B?YjVqSUpwWWRMQzVmWENqM0xzZmQvVktGK1Z0MXNKMHhPaDVkSDVEMlloNW8x?=
 =?utf-8?B?NzhHZWVsUXFETnM1blBRSGNhd2hnMkJLZXZHSmFONUcvQ0Z2T1p2eTh2aTdi?=
 =?utf-8?B?ZWIyaHhlRzM2VmNRNUpJZVNLSytMQTFkdkh4ODN6RFhremdMOXRlOWJQUzIx?=
 =?utf-8?B?bU1jMkhUKzV6VmZjYzE5UGI5aDlGZGdMaTFEWG9yTWQzTmtMNnFKb1Q5b1lq?=
 =?utf-8?B?T2xOOWJoa2xVTnRRdENjOU9SM2RVOXUrMmt2cEdINVN2VzNqQlFFQXhvSVJ1?=
 =?utf-8?B?eE9BdzI5TGVGbFlCZTlKQUYyQVpETXdpSGtHWWg4bzNiS05ISFhQdkpWWWxi?=
 =?utf-8?B?WU9NdlFpZFJ1cFpFZlhhUk9xdGQ0c0F3bkZhWmdzekJuZzcya21DbytVVzQz?=
 =?utf-8?B?TGhWWldFNHdsTU1SUlJueTgzcjZTVmF6dmJQWGRZSVNqV01vS1RRODZrTDI2?=
 =?utf-8?B?QlA3V0FhbjVPMXB5eXJUVEs0bnRpdHFJcU1oNzIwZXJXU3hvMWN5VnVDb1Rx?=
 =?utf-8?B?RCs3WEJrZ1ZtOW1ieVEzNm56NU81S1BLNFk1TWFPN210bWI0TUthTzJYVjJu?=
 =?utf-8?B?cEQycEl6aGxtY3RSVmhQMHJaeEUvcTdRck1jbkVZOXdRcS9JTHI5ZDhKU1BW?=
 =?utf-8?B?N042enJpQ05SS2NTRTdnM3BvdUk2ZnMyNHZIOVNhR1lSdFpJaGZhdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e4d02a-44e6-41df-3ae0-08df2858adc4
X-MS-Exchange-CrossTenant-AuthSource: LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 12:02:24.8535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cIKy8Gpz111bEVgy01YuPd1+r8zXcn2nyDI9ssicSlPPk6CtLkJpGt4E+UhJOzZgT3FLLx9L7kTgwnc6b0yUJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6667

On Mon Oct 12, 2026 at 11:26 AM BST, Onur =C3=96zkan wrote:
> LockSet is a high-level and safe API built on top of
> ww_mutex which provides a safe and easy to use API
> while keeping the ww_mutex semantics.
>
> When EDEADLK is hit it drops all held locks and waits for the
> contended mutex. It then retries the given (by the user)
> locking algorithm with that mutex held and the same acquire
> context until it succeeds.

Do we really need this, or this can be achieved by simple retry loops?

    fn retry_if_deadlock<R>(f: impl FnOnce() -> Result<R>) -> Result<R> {
        loop {
            match f() {
                Err(EDEADLK) =3D> (),
                e =3D> return e,
            }
        }
    }

    stack_pin_init!(let acq_ctx =3D AcquireCtx::new(&class));
    retry_if_deadlock(|| {
        let mut gaurd1 =3D acq_ctx.lock(&mutex1)?;
        let mut guard2 =3D acq_ctx.lock(&mutex2)?;

        acq_ctx.done();

        *guard1 +=3D 1;
        *guard2 +=3D 1;
    });

I think the only difference is that the `LockSet` acquires the contending m=
utex
first. However, I imagine we can solve this by having a wrapped `AcquireCtx=
`
that provides that.

Best,
Gary

>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  rust/kernel/sync/lock/ww_mutex.rs          |   6 +
>  rust/kernel/sync/lock/ww_mutex/lock_set.rs | 449 +++++++++++++++++++++
>  2 files changed, 455 insertions(+)
>  create mode 100644 rust/kernel/sync/lock/ww_mutex/lock_set.rs


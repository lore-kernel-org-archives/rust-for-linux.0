Received: from outbound.pv.icloud.com (p-west1-cluster5-host6-snip4-3.eps.apple.com [57.103.66.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1852DC79A
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 23:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.66.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769642573; cv=none; b=s6N8fpH/S436hzPdigvxqhARqXBRsxKj3WEApqWP9qQFxCkhq8UAuSKbM5GxXToktK6KgbxRi7iCGA2SmrueymWCZNDOv7tFpNV0sLedEJJqTB+pyINJvdQLECpMGN4hnF9wBIFYGHOLG5bl+xuiXQWp9gebIGq1BXZ/KjB6G1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769642573; c=relaxed/simple;
	bh=7WNO1p4Fcz/bkHPRDt0M8P4yPLCTin7DBSSca+m6mzw=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=HoAi4zYS7qfm6nYrqagvio5FTIlrbycg6ECuniP+Zt242fePpR12/pZyhFUIQLXKqFcV7IFKREAGPHXqBBIKApLw6/N0fQ8M7YbPgLhJgjZmL8nLptMDBJtl+DwNR4tyk+bJE4i+wDXXpAMUHKaXe4IvNfCnWT5JIsQ92D5GGQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=t3tI1EvF; arc=none smtp.client-ip=57.103.66.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="t3tI1EvF"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-6 (Postfix) with ESMTPS id EAA421800240;
	Wed, 28 Jan 2026 23:22:46 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1769642571; x=1772234571; bh=4rlYwyl0fajeKi8BnPkM/DyacF6/ITorpIiqTkpEWMg=; h=Date:Message-Id:To:Subject:From:Mime-Version:Content-Type:x-icloud-hme; b=t3tI1EvFPCEaF4uqHnEdMxbj8dFBLncXGD7RU+6WRdIIn84ES4UKf0YljkKX9f+x6c3maZwUuyq/bVllNfRxQHHf7eEtlaLVcRzbzCHSztz2SxagVxHYjUvu/G4MFc4TGArE+78Y4S1bMAz9qfUAdptvFA/OY/q/12zgyAnaOWSybrrClwbuGtQOYZCQpGnfo1sOEslFodipbzkXXNUYoGdJwPQZLCYkYP5iauuJInlVqgaQlfrLqduTuLL7WWCZ2G+gx1qt1K109EekOGk7I6N/clhrYY03wlTCUj7BC2bi8xL12w0MiQWXuxY8XHDi6ljEzdO2LlPbP8BE2OG9RA==
mail-alias-created-date: 1769500909675
Received: from localhost (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-6 (Postfix) with ESMTPSA id 6E21418000AA;
	Wed, 28 Jan 2026 23:22:44 +0000 (UTC)
Date: Thu, 29 Jan 2026 08:22:43 +0900 (JST)
Message-Id: <20260129.082243.2839763699303055.fujita@bee>
To: boqun@kernel.org
Cc: gary@garyguo.net, tomo@aliasing.net, boqun.feng@gmail.com,
 ojeda@kernel.org, peterz@infradead.org, will@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 dakr@kernel.org, lossin@kernel.org, mark.rutland@arm.com,
 tmgross@umich.edu, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v1 1/2] rust: sync: atomic: Add perfromance-optimal
 Flag type for atomic booleans
From: FUJITA Tomonori <tomo@aliasing.net>
In-Reply-To: <aXpFEhJxbF6cRhAZ@tardis.local>
References: <20260128115200.3820113-2-tomo@aliasing.net>
	<DG09KR1O5JL3.3VYRDKRR8UXX8@garyguo.net>
	<aXpFEhJxbF6cRhAZ@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDE5MyBTYWx0ZWRfX7LaLcj8Hqk+z
 ZGXiTx2FZEtVeVrtXL5krOus0DGqTa1n4pMxZr1lOndlthjezoWcMBPtFRMimliYF21YNhYOIi6
 JHUQ2vL8/UYDrrDT4i2xdEBRF9JBpB+QyNFHcPTcNGH9gHb6Spti44ArDP5NnJc7EUCTOzTd+Ie
 X9vjEK46m1BZ0aMMJzLiIffxhQIzXkc+4ZeAgNC65slSq3OqaBvQng9EcrftRmHMktbJUkUzhsm
 X9LNA80mG74ZLepH1mzOPPODrt6pBLBFG670soC/N9XKkV4FulNSsY3Nyd9qPJ7rd16zqNgWbOr
 h8g60TmU1NxJLVW9TDJhVDIo9VTAqUdooMtJGDbJR8d7NztYMKtqqCYXrOjBiA=
X-Proofpoint-GUID: JuXi2Ozs_Ao3vle0QUgt65fzetIXqyn0
X-Authority-Info-Out: v=2.4 cv=b8C/I9Gx c=1 sm=1 tr=0 ts=697a9a48
 cx=c_apl:c_apl_out:c_pps a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=3TVKTRz2z76xw4FSWDEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: JuXi2Ozs_Ao3vle0QUgt65fzetIXqyn0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 clxscore=1030 bulkscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280193
X-JNJ: AAAAAAABNm247sTygPkcBHOOHamBWJ9CVhIAGBE5VS8GcwnQQBWRh0cL8qqDf5y9kaYSwpM9y8a7R47nT+XfRv+771dOXD4VLZ4bcSoaj3c/HL9Adup5IKpFAb+sdYCy5zH4BJHjCKaRUM7e4mK9aaPXGLW3SrUEEbzLNBGmBlcg0UT15lCuAofX2zGRu6J/NEcNDH2K8NXSHLTcpGssSQfQEVit7dtX2uaBYKz06ZW4qUJ7IkDm0mxPIRpGKFhmvOw0xAFpUSQ6WEOVECRVaPjbm6yYkstoK/Ttp2csGmdkp2hSHMqGLwFSYODiWF7pWZqFd+sGMp7Dj8cX8N70IIc22O/clDJvZhDLVsmIrq6HdWcb6AVjdawsoHiCoA2Sg6XDmwzBZIypp6SyMS4krzOgD3r2kecwJ3usfr4TeWBuPOBaa8D3AOiaw2aKXpZH4aJpsxzqBGUhbhRhpufwcSqr6Mm1o6TrZlEi9joPz/uXECLefZTV5gzTVfCogGDmA6ZCDluO6YM7SnfFJri1lQ7AJFYM6SRSW5b4PjrzWeRFZqkhf2Q0ghui8q+c1JkfGst0fDnSF5uKa1E5CgwIMCiOBSwL2PMVOa205D9rcajqIn0GzzZd2YjOsmPuyQPCde/ufh25IRqEyhf4YQMr3CN0Hg0AVD8bbPv4qJv32/p1jzDfrkUUP50t1ycz4cvV8qQkDgt/HhfCj1ktVu25X5V/E/1pBqSYBa4xUfrkYp9T4KUER5NnmLRYDU7MYhiC3461MT5TeaQTnxzi3orfC9oOj3Huu5/mP8YbsLixFjjj/mTZQAqxEiV3

On Wed, 28 Jan 2026 09:19:14 -0800
Boqun Feng <boqun@kernel.org> wrote:

> On Wed, Jan 28, 2026 at 01:41:41PM +0000, Gary Guo wrote:
>> On Wed Jan 28, 2026 at 11:51 AM GMT, FUJITA Tomonori wrote:
>> > From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> >
>> > Add AtomicFlag type for boolean flags.
>> >
>> > Document when AtomicFlag is generally preferable to Atomic<bool>: in
>> > particular, when RMW operations such as xchg()/cmpxchg() may be used
>> > and minimizing memory usage is not the top priority. On some
>> > architectures without byte-sized RMW instructions, Atomic<bool> can be
>> > slower for RMW operations.
>> >
>> > Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> > ---
>> >  rust/kernel/sync/atomic.rs           | 121 +++++++++++++++++++++++++++
>> >  rust/kernel/sync/atomic/predefine.rs |  17 ++++
>> >  2 files changed, 138 insertions(+)
>> >
>> > diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
>> > index 4aebeacb961a..7d06193709c0 100644
>> > --- a/rust/kernel/sync/atomic.rs
>> > +++ b/rust/kernel/sync/atomic.rs
>> > @@ -560,3 +560,124 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering)
>> >          unsafe { from_repr(ret) }
>> >      }
>> >  }
>> > +
>> > +/// # Invariants
>> > +///
>> > +/// `padding` must be all zeroes.
>> > +#[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
>> 
>> This config repeats too much.
>> 
>> I think probably we should just not let `AtomicFlag` alias `Atomic<u8>` (this
>> has the benefit of creating a type mismatch, so code cannot rely on this on x86
>> and fail to compile on, say, RV).
>> 
>> This way the `struct Flag`, `struct AtomicFlag` and `impl AtomicFlag` would
>> always exist and the config is only needed for much fewer times (plus, you don't
>> need to macro to avoid duplicating docs).
>> 
> 
> You probably still need configs for `#[repr(align(_))]` in that case or
> two definitions of `Flag` anyway. but yes the duplicate docs can be
> avoided, so are some impl blocks.

If we go with cfg_attr, we get something like the followings:

#[cfg_attr(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64), repr(C))]
#[cfg_attr(
    not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)),
    repr(C, align(4))
)]
#[derive(Clone, Copy)]
struct Flag {
    #[cfg(all(
        target_endian = "big",
        not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64))
    ))]
    padding: [u8; 3],
    bool_field: bool,
    #[cfg(all(
        target_endian = "little",
        not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64))
    ))]
    padding: [u8; 3],
}

I think that two definitions of `Flag` is more readable here.


> BTW, while we are at it, maybe we should use arches that don't support
> byte-wise atomic instructions here instead of the ones do, i.e. 
> 
>     #[cfg(not(any(CONFIG_RISCV, CONFIG_LOONGARCH)))]
>     #[repr(C)]
>     #[derive(Clone, Copy)]
>     struct Flag {
>         bool_flag: bool,
>     }
> 
>     #[cfg(any(CONFIG_RISCV, CONFIG_LOONGARCH))]
>     #[repr(C, align(4)]
>     #[derive(Clone, Copy)]
>     struct Flag {
>         #[cfg(target_endian = "big")]
>         padding: [u8; 3],
>         bool_flag: bool,
>         #[cfg(target_endian = "little")]
>         padding: [u8; 3],
>     }
> 
> and we should do
> 
>     unsafe impl AtomicType for Flag {
>         #[cfg(any(CONFIG_RISCV, CONFIG_LOONGARCH)))]
> 	type Repr = i32;
>         #[cfg(not(any(CONFIG_RISCV, CONFIG_LOONGARCH)))]
> 	type Repr = i8;
>     }
> 
> as well.

Is the idea to list only arches without byte-wise atomics so new
byte-atomic-capable arches don't require updates?

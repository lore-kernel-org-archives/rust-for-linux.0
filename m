Received: from outbound.pv.icloud.com (p-west1-cluster4-host9-snip4-10.eps.apple.com [57.103.65.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8B32BDC0B
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 03:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.65.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769571141; cv=none; b=YNMhUDZC8WW9rr0a4s1V5G2pvJOenc7nLP7BR0IbgTw8Z5TeXdfXx8w70jwYudWNEDNO756/vr0dgTKA8SCJkwjGcU6JYxbWZvdNXr+mFRsA6tExuAvreirguYZQxk7pa9tGFDIvAS/Zus+CdJ7USRUmHzGx+UimUpevmqPPW0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769571141; c=relaxed/simple;
	bh=hpLdP0Zc1/qLX85Up3j2D4OruWTiVzDJyO6Ls32xAMs=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Fkd2ygUKZytKoif/5UVQE6pe4N0asC20kPF25MLHVteTLgkt7f/bbcc0IOwtJEAcq9C/F1Qpx3ltPKxDv+tefXCYp1jGnaJC7zSTexsvFhCYtAbcGdJgHQ/xx2mHUytFMLfO06YCRL0Ww9YI7DojViyKWZpnZxCmtmIU0u3SHZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=vwrgcHWt; arc=none smtp.client-ip=57.103.65.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="vwrgcHWt"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-1 (Postfix) with ESMTPS id A69AA1800131;
	Wed, 28 Jan 2026 03:32:17 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1769571139; x=1772163139; bh=A6OjfsUZQqCA0qkVQGCI6gVPXHOK09L6RIUJGxp1Id0=; h=Date:Message-Id:To:Subject:From:Mime-Version:Content-Type:x-icloud-hme; b=vwrgcHWtoG9PpBnHjaToqm/FE0SYedrXyc2uiq9gLiQ/PWGaL1h15YscrSRQ0dPuYUaHMymaqO1anoeNV/2r/F9qZSmTIhbwc1haB2D6QADn6+5kE8QSk3j9hfDSwBa+5VHGh56BPVKeKA9nZMBhmSyQR1RjsapbSKgMFNWQqaRS+hQoZZXcVF5lU+S5nh5XNW7aGE9GWVdu8W/SCcjLZxi/yt1nW+2KhBt6ELxuJ1OeL9H2/9lNF+nLyYvaO4ww/zesqQy96aoConRFxUzZkj5Kaos1tOVEmEjOucaRk1c6tbOb7s5sHDQThYW3AU4SYPcEylXXIOpUKexV0YJWPg==
mail-alias-created-date: 1769500909675
Received: from localhost (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-1 (Postfix) with ESMTPSA id 2BB14180011A;
	Wed, 28 Jan 2026 03:32:15 +0000 (UTC)
Date: Wed, 28 Jan 2026 12:32:12 +0900 (JST)
Message-Id: <20260128.123212.248535348759706770.fujita@bee>
To: boqun@kernel.org
Cc: gary@garyguo.net, tomo@aliasing.net, ojeda@kernel.org,
 peterz@infradead.org, will@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
 lossin@kernel.org, mark.rutland@arm.com, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v2 1/2] rust: sync: atomic: Add AtomicFlag::get_mut
From: FUJITA Tomonori <tomo@aliasing.net>
In-Reply-To: <aXjpMhRytX-W3AX9@tardis.local>
References: <aXjg4jv-3aQcy4O0@tardis.local>
	<DFZI47QW7VTE.1PF5P6LUTASVS@garyguo.net>
	<aXjpMhRytX-W3AX9@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RnEIcwJylQGm6DJZpvhR3JJKzw0wRhXA
X-Authority-Info-Out: v=2.4 cv=brpBxUai c=1 sm=1 tr=0 ts=69798342
 cx=c_apl:c_apl_out:c_pps a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=cpreI_3xfpZTddIiUs8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: RnEIcwJylQGm6DJZpvhR3JJKzw0wRhXA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDAyNSBTYWx0ZWRfXzStmM2W0cX57
 3bZQkWhSiIkPHXyLmUcxJ/ABzKDQmScfrJ5276RcPfWANrelwZzu86DPa/b+1JyXROue3m3xA9A
 9qsgrFEe2i+i40DE+vHIZgRUVa1ZVUerxql6Cs4Kzgv6GSVZwVRTeF4hMWqbAo9miyujlaAYCEA
 r3elnrjd4HgGAyCc+MGcPaYUeL76KWclwDIoHEvgObP1O3ckdYPGcpRxkEFHy9FBTJRvNYYB80J
 lMfOq1VeQ2kqYqf+15ZUs2haYh+hqc8L4gIJRWnw97YjtGhet+hacZCkWeXbawbXR/t0TaYx/7I
 JE0ddLeUgop/aLorvDkkMHu+XQvBe7vlYt84RX79irCq1stEAYfjizTZfMzeh0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_05,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 clxscore=1030 lowpriorityscore=0 bulkscore=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 mlxlogscore=999 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280025
X-JNJ: AAAAAAABYxS4MsvJUiHiQ0b1HeelxRUK/igu7afXAbbbOtRBOC04RSlz05vfDIyg6yjJSQqa0bU6SSKDJc3R+sWzG2iHKFBHXLja384MzUBQ4yvOTyFfEfQ4HnAprygaS7xLx3bU17TZaysYGitG4lQBY2nvoX67edH/1J6xIOxjTY1N9rLZRQ/0mNhgk+pXWse/ttA58Zm9E8XJ8n8hgPW5TmOl9YX4XzkG5OHuWIxtbCwtkJ82aLogy/XHGFEgXnxTmfc9+7QgLCanHk8trZIQas8qlTMgRgWTTDcbkp0HSNNPC/gurJbhcl3EalUsqdqCQNME0pNadfahHHcBTZnf2hHkLMCDmsCBm9vDhLzJD/OPPKIbE00/uMhkIW4KiqtpTItqG2FpliFwNFZWGqrMvBlhZF/pnqjVYaX/9bDNRL9iTTrRe6W5UMmYZ3qDWjL08TcscKxparmIg7YdgP7lnMgOfFr4lP/u+Qo1Amvd5Y7OI5KhStkrRdFz4HOF21qm14B7OYOAiRPA99RGymF25VQzYBT+A+XvSNKlAybmOFrUECUz18LZfyvb7BP1l1XQRY1ZR5F3e8oxPpDiv456Sr+vyYPJl9mXnx7MZkyP0pmF9tbNz958TyXPX6SaSgoJCjdvjyUw6EM71OYUv+0JzZh6OlNShb1oni13Itv7RwUEtxxm577lzf5/v+O6hi1mpJ+H0RmAXJY8AfOjQjmQUJhVEfQjVEykvDsnxM9M0YjHxByqshox4WALHMeaKZvB9OevuhIVzQhv1SCED5n28hw8my+zES5ceobxtQ==

On Tue, 27 Jan 2026 08:34:58 -0800
Boqun Feng <boqun@kernel.org> wrote:

> On Tue, Jan 27, 2026 at 04:10:35PM +0000, Gary Guo wrote:
>> On Tue Jan 27, 2026 at 3:59 PM GMT, Boqun Feng wrote:
>> > On Tue, Jan 27, 2026 at 03:42:42PM +0000, Gary Guo wrote:
>> >> On Tue Jan 27, 2026 at 3:35 PM GMT, Boqun Feng wrote:
>> >> > [For some unknown reasons, I cannot send my reply via gmail hence reply
>> >> >  via kernel.org account, I might switch from gmail later on]
>> >> >
>> >> > On Tue, Jan 27, 2026 at 09:52:59PM +0900, FUJITA Tomonori wrote:
>> >> >> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> >> >> 
>> >> >> AtomicFlag exposes a bool API, but it lacks a get_mut() equivalent to
>> >> >> Atomic<T>::get_mut().
>> >> >> 
>> >> >> Also add kunit tests for AtomicFlag.
>> >> >> 
>> >> >> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> >> >> ---
>> >> >>  rust/kernel/sync/atomic.rs           | 20 ++++++++++++++++++++
>> >> >>  rust/kernel/sync/atomic/predefine.rs | 17 +++++++++++++++++
>> >> >>  2 files changed, 37 insertions(+)
>> >> >> 
>> >> >> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
>> >> >> index 6c46335bdb8c..b6c01d9f3a46 100644
>> >> >> --- a/rust/kernel/sync/atomic.rs
>> >> >> +++ b/rust/kernel/sync/atomic.rs
>> >> >> @@ -591,6 +591,26 @@ pub fn store<Ordering: ordering::ReleaseOrRelaxed>(&self, b: bool, o: Ordering)
>> >> >>          self.0.store(b.into(), o)
>> >> >>      }
>> >> >>  
>> >> >> +    /// Returns a mutable reference to the underlying flag as a `bool`.
>> >> >> +    ///
>> >> >> +    /// This is safe because the mutable reference of the atomic flag guarantees exclusive access.
>> >> >> +    pub fn get_mut(&mut self) -> &mut bool {
>> >> >> +        let byte_ptr = {
>> >> >> +            let ptr = self.0.as_ptr().cast::<u8>();
>> >> >> +            let offset = if cfg!(target_endian = "big") {
>> >> >> +                core::mem::size_of::<Flag>() - 1
>> >> >> +            } else {
>> >> >> +                0
>> >> >> +            };
>> >> >
>> >> > The idea is solid, but I want to avoid endian handling in the function,
>> >> > I would prefer a "struct declaration" solution like:
>> >> >
>> >> >     #[cfg(target_endian = "big")]
>> >> >     #[repr(align(4))]
>> >> >     pub(super) struct FlagInner {
>> >> >         _pad: [i8; 3],
>> >> > 	bool_field: bool,
>> >> >     }
>> >> >
>> >> >     #[cfg(target_endian = "little")]
>> >> >     #[repr(align(4))]
>> >> >     struct FlagInner {
>> >> > 	bool_field: bool,
>> >> >         _pad: [i8; 3],
>> >> >     }
>> >> >
>> >> > redefine `Flag` as `BoolFlag`
>> >> >
>> >> >     #[repr(i32)]
>> >> >     pub enum BoolFlag {
>> >> >         Clear = 0,
>> >> > 	Set = 1,
>> >> >     }
>> >> >
>> >> > and `Flag` becomes a union of `BoolFlag` and `FlagInner`:
>> >> >
>> >> >     /// # Invariants
>> >> >     /// `Flag` is either 0 or 1 in a i32 representation which implies
>> >> >     /// that `inner` is always valid as long as `_pad` stays 0.
>> >> >     pub union Flag {
>> >> >         pub(super) inner: FlagInner,
>> >> >         pub flag: BoolFlag,
>> >> >     }
>> >> >
>> >> >     // can static_assert that `Flag` and `BoolFlag` has the same
>> >> >     // alignement and size.
>> >> >
>> >> > then
>> >> >
>> >> >     impl AtomicFlag {
>> >> >         pub fn get_mut(&mut self) -> &mut bool {
>> >> > 	    let flag = self.0.get_mut(); // <- &mut Flag
>> >> >
>> >> >             // INVARIANTS: flag.inner._pad cannot be modified via the
>> >> > 	    // returned reference.
>> >> > 	    // SAFETY: Per type invariants, `flag.inner.bool_field` is
>> >> > 	    // always a valid bool.
>> >> > 	    unsafe { &mut flag.inner.bool_field }
>> >> > 	}
>> >> >     }
>> >> >
>> >> > Thoughts?
>> >> >
>> >> > Regards,
>> >> > Boqun
>> >> 
>> >> I think we really need special handling for endianness for this one single
>> >> function, so doing all the extra stuff feels really unnecessary.
>> >> 
>> >
>> > First, this one single function changes the design actually, previously
>> > you can even implement a Flag as:
>> >
>> >    enum Flag {
>> >        Clear = 6,
>> >        Set = 7,
>> >    }
>> >
>> > and it'll work, that is as long as `Flag` behaves like a bool, it's
>> > fine. But now this function implies there is actually a bool in `Flag`,
>> > which is kinda totally different.
>> >
>> > Besides, by using the current implement, we set an example about "how to
>> > do a byte offset in an i32 for different endians", and then if anyone
>> > wanted to do something similar, very likely they would copy-paste and
>> > modify what we have here. The potential tech debts are significant. So I
>> > would like to do it in a right way ("right" is probably subjective, but
>> > it comes from someone who needs to live with the code as a maintainer
>> > ;-) and I'm happy to switch to a better way if necessary).
>> 
>> I think what Fujita has is more "proper". Your approach still have the issue of
>> requiring a specific ordering of the fields. If this is messed up, then the
>> entire thing is broken. I.e. the safety proof of `get_mut` depends on the fields
>> being ordered correctly in `FlagInner`.
>> 
>> If you want to go down this route then I would just scrap `enum Flag` all
>> together and always define it as struct, with an internal `bool` + 3 bytes of
>> zero padding. This way we don't even need unsafe for `get_mut`.
>> 
> 
> Hmm.. so like:
> 
>     const PAD_SIZE: usize = <3 or 0 depending on ARCHs>
> 
>     /// # Invariants
>     /// `pad` has to be all zero.
>     struct Flag {
>         bool_field: bool,
> 	pad: [i8; PAD_SIZE],
>     }
> 
>     impl Flag {
>         pub const fn set() -> Flag {
> 	    Self { true, pad: [0; PAD_SIZE] }
> 	}
> 
>         pub const fn clear() -> Flag {
> 	    Self { false, pad: [0; PAD_SIZE] }
> 	}
>     }
> 
> ?
> 
> Yes, I think it's better ;-)
> 
> Also, now given that `AtomicFlag` behaves exactly like a `Atomic<bool>`,
> should we do:
> 
>     /// `AtomicFlag` documentation here.
>     #[cfg(<Arch supports byte-wise atomic>)]
>     type AtomicFlag = Atomic<bool>;
>     #[cfg(<Arch doesn't supprot byte-wise atomic>)]
>     struct AtomicFlag(Atomic<BooleanFlag>);
> 
>     // `Flag` doesn't even need to be public.
>     #[cfg(<Arch doesn't supprot byte-wise atomic>)]
>     struct BooleanFlag { ... }
> 
> (I renamed `Flag` -> `BooleanFlag`)
> 
> Thoughts? I don't think there is any extra benefit of exposing
> `Atomic<BooleanFlag>`.

Agreed.

You prefer the cleaner git history? Then I'll send the next version
for rust-sync-fixes, to implement BooleanFlag (or Flag) and AtomicFlag
from scratch.


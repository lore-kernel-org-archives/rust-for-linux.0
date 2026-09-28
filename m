Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19AC48FF94
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Sep 2026 09:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588508; cv=none; b=J9kkNkePtImWLCUkeN17TcfEoWm2gIiasJqDe7KqH1sH3NOxp8Qq8+Pw+ifezMN0Gqjpy1IUTwlKND6zQPZm5kx3EvJPfxTA1Aj6qBqMMC2X8hul94EYyCGATsHhqzwzCgba0GCtzdSH0wZq+8lVbUew3urrmg62ivF5HIbq6Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588508; c=relaxed/simple;
	bh=sRNyk/XzsKKiijrdKQ7GZlEzfQNp1o2DTEz7wqOkRXE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GzNv+5s0diMqDuz0q0v+hR7rKadDqiI+8mNvLczG8o7oA2ZdZp30wHCBOXVStYyBmAMf2t3UQB+7yY1Fg/XLgDGKalfQvNA7BdfCt6fjmSuBFIi2iIDsH/L5nv7CFoJXZqQFQRdBmGeKQ3EKeI9rxDkq398CoqGAgeSKn49eUVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GiH03/lT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GiH03/lT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8721F000FF;
	Mon, 28 Sep 2026 09:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790588507;
	bh=4bJ2ZCaiYXL7kuViO1LQfhyCa8Wwsb37tGO5DqsKi0o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=GiH03/lT/W+7/9BvfCx6mm+stGZFVm062MoN18aaU2ORt2N7XcV0sddtg9pJbp+SR
	 0lQ68ZWdQgk/D2XbTZfRjshnG8ZqX8vzlIA2hRvwSeZ972T9heDp3Aw9kv73Fo847n
	 Vbn14dAfK4axjHN+beLDFEQKGoBleT19LdvoLRceMtdbw2RSaMDzhwcGOFABZ2v72+
	 LfScP2Z/3k5f5nYZKseqTcHT/sfox0HYuWoWoTXNI/AM0xnvyK4lG+QtBsP0+LchJz
	 SF970TTiYI1aDYrNcOBJLRhpN3QacfrcN4GAgTET5MDvxO1qbHSpE9m3dUm5pFGcCJ
	 0UZId7ig4GlSA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, boqun@kernel.org,
 fujita.tomonori@gmail.com, frederic@kernel.org, lyude@redhat.com,
 tglx@kernel.org, anna-maria@linutronix.de, jstultz@google.com,
 sboyd@kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: time: add debug assertions for out-of-range input
 in fsleep()
In-Reply-To: <CABFDxMGJeQO87vG1wKZ2UecKMy450NohJnr4EPDBXqj7HvJG-Q@mail.gmail.com>
References: <qBPUAToMpl5CvVd22lUrJOgsVSuqVYKsjEHpbs1UK-VTO-vN8UFOa35fFMsYOHoBuUp9HcP65ljAxmLQMcGS9w==@protonmail.internalid>
 <20260508173827.1123011-1-ekffu200098@gmail.com>
 <87a4u96m4c.fsf@t14s.mail-host-address-is-not-set>
 <DIE4WB0VE43Z.2ALSYOD50N5X7@garyguo.net>
 <87pl346466.fsf@t14s.mail-host-address-is-not-set>
 <DIE8AGXTZXBL.2RY8JCWNOD2HG@garyguo.net>
 <87mry85vh7.fsf@t14s.mail-host-address-is-not-set>
 <CABFDxME98=KTERw17UYEs-5yKJvibXd-RZQ5rUOt7QgE4zk3vw@mail.gmail.com>
 <87o6do2x3u.fsf@t14s.mail-host-address-is-not-set>
 <CABFDxMGJeQO87vG1wKZ2UecKMy450NohJnr4EPDBXqj7HvJG-Q@mail.gmail.com>
Date: Mon, 28 Sep 2026 11:41:39 +0200
Message-ID: <87o6dhu2zw.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sang-Heon Jeon <ekffu200098@gmail.com> writes:

> Hi, Andreas
>
> 2026=EB=85=84 9=EC=9B=94 23=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 5:25,=
 Andreas Hindborg <a.hindborg@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
>>
>> Sang-Heon Jeon <ekffu200098@gmail.com> writes:
>>
>> > On Sun, May 10, 2026 at 2:44=E2=80=AFAM Andreas Hindborg <a.hindborg@k=
ernel.org> wrote:
>> >>
>> >> "Gary Guo" <gary@garyguo.net> writes:
>> >>
>> >> > On Sat May 9, 2026 at 3:36 PM BST, Andreas Hindborg wrote:
>> >> >> "Gary Guo" <gary@garyguo.net> writes:
>> >> >>
>> >> >>> On Sat May 9, 2026 at 9:08 AM BST, Andreas Hindborg wrote:
>> >> >>>> "Sang-Heon Jeon" <ekffu200098@gmail.com> writes:
>> >> >>>>
>> >> >>>>> fsleep() documents out-of-range input as a bug but does not che=
ck
>> >> >>>>> it, unlike udelay(). Add `debug_assert!` calls to catch it in
>> >> >>>>> debug builds.
>> >> >>>>>
>> >> >>>>> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
>> >> >>>>> ---
>> >> >>>>> Hello,
>> >> >>>>>
>> >> >>>>> I found this small inconsistency while reading the code. The sa=
me
>> >> >>>>> check was applied to udelay() [1] but does not seem to have been
>> >> >>>>> extended to fsleep(). Please let me know if I have misunderstood
>> >> >>>>> anything.
>> >> >>>>>
>> >> >>>>> [1] https://lore.kernel.org/all/20251103112958.2961517-2-fujita=
tomonori@gmail.com
>> >> >>>>>
>> >> >>>>> Best Regards,
>> >> >>>>> Sang-Heon Jeon
>> >> >>>>
>> >> >>>> Looks good to me. Could you add the warn_once and remove the tod=
o as
>> >> >>>> well? And add the warn_once to udelay as well, so both functions=
 have
>> >> >>>> same shape.
>> >> >>>
>> >> >>> If `warn_once` is added then the debug assert would be unnecessar=
y.
>> >> >>
>> >> >> It is different mechanisms in different situations, right?
>> >> >> `pr_warn_once` prints a warning once (and a stack trace depending =
on
>> >> >> kernel configuration?). It would be enabled in production environm=
ents,
>> >> >> and it allows the thread to continue executing after triggering.
>> >> >
>> >> > The existing comment and your message says `warn_once`, not `pr_war=
n_once`.
>> >>
>> >> I actually mixed these up, thanks for pointing that out. We do not ha=
ve
>> >> `warn_once!` yet.
>> >>
>> >> >
>> >> >>
>> >> >> `debug_assert` panics when debug assertions are enabled, otherwise=
 is
>> >> >> compiled out.
>> >> >>
>> >> >> I don't think one makes the other unnecessary.
>> >> >
>> >> > I don't think there should be two checks of the same thing. Even if=
 we want
>> >> > different behaviour depending on if debug assertions are enabled or=
 not, it
>> >> > should be a single macro that switches behaviour based on that conf=
ig.
>> >>
>> >> Apparently this was discussed in start of April [1] (I somehow missed
>> >> it), and as far as I can tell, consensus is that we do not use
>> >> `WARN_ONCE`. Instead we use `debug_assert` with `pr_warn_once`. That
>> >> sounds reasonable to me.
>> >
>> > Above explanation is reasonable to me. So I'll add `pr_warn_once`  to
>> > fsleep() and udelay() both.
>> >
>> >> This can be a combined macro or open coded, either way is fine with m=
e.
>> >
>> > I don't have a strong preference about this either. Maybe we can
>> > handle it in a separate patch.
>> >
>> >> I think we should add the `debug_assert` as suggested by this patch, =
add
>> >> the `pr_warn_once` in the not taken branch, and remove the TODO about
>> >> `WARN_ONCE`. We can bike-shed a combined macro on the side.
>> >>
>> >> Sounds reasonable @Gary?
>> >
>> > Any other opinions are welcome including Gary.
>>
>> Still waiting for a new version of this patch. Let me know if I missed
>> it somehow.
>
> You already replied to v3 [1] :) Let me know if I missed it somehow as we=
ll.
>
> [1]  https://lore.kernel.org/all/20260621105909.4055210-1-ekffu200098@gma=
il.com/#t

Thanks! It was a spreadsheet update error on my end.


Best regards,
Andreas Hindborg




Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 335C4C433EF
	for <rust-for-linux@archiver.kernel.org>; Fri,  8 Oct 2021 21:32:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0628860FF2
	for <rust-for-linux@archiver.kernel.org>; Fri,  8 Oct 2021 21:32:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243435AbhJHVen (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 8 Oct 2021 17:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230384AbhJHVem (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 8 Oct 2021 17:34:42 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00663C061570
        for <rust-for-linux@vger.kernel.org>; Fri,  8 Oct 2021 14:32:46 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id n7so3354446iod.0
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Oct 2021 14:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LM9irX8xumxp4TIr9cZC8VWpmESQECbIIBoHRou9P3g=;
        b=QGK2w5pfEYqW7GvsEl1srNBV+T4P6AJnS7mVhpBQDz/iMUh011pQ7Tvb/Olufwej2q
         iho3oX7Wu6NZWEAk3oETbLTu1VvXePBijx40eqBwvLuwTUFwHvCUSBLZ0CosVYO7sk3j
         kV2jI12W1EgWke7ClURNa4fGeHTf3TFigQNmOa8JEjo93L8WXfCN1kLdZlSSSreuPlVZ
         oakM6c7wzu7uoPtI47h03P3R2yhZGSgurBgevLWnjdwNJyN1WGbPb8d8DZyknmX7vbev
         h03WVag6VXjdPvtvbRMHAkvdxCDnozcF7X/JJEI+9cKaNlm2XA+aceNy+NBW94OH5qJI
         r7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LM9irX8xumxp4TIr9cZC8VWpmESQECbIIBoHRou9P3g=;
        b=o8R0H9vHG5iEicFwxVJybfrX1Lb+di+p9GLgJFGaUZwOkv1r+KmnulSDShV+Ztl33r
         06dVTi7/wJDeMkXroyg2cN0xYIbq6ArRpa4SVTOkxtZOV75LQmsPccAe48gKxqRvtsU0
         XMZmnfZfT7l3EJiMjEFnnznLZprEFlFWfT5rXHfNsEzb77YC79t5lh3D8AmEjbIyHGjJ
         V2L5WVmIo4/ef+/HttFY/g18pi6r1SdfRkrZNu9JLsBUVTFmryceqVYbauQblQmIN+7M
         KqsVIkLnWyAvozm/faL6tPlcn5HTv1zVQ4CFZsh3Pqh9ZomWaMzIGqPqevdOcF+TGBog
         4jbQ==
X-Gm-Message-State: AOAM53144vX1JZ3RyqphVRvc4yfFueKMkYPm5/fa8qaJGR3uvIuAJpc4
        214oABQtUgaK91EL4UuKkZLjORbEWcbYV+LZm3Y=
X-Google-Smtp-Source: ABdhPJx/pc/aX53QEe5tzkspmSCrBx4LqFVwABijPAO2FX2tel5+fxeh2ceJvLtBXCBU9OG9e8cuNNtgDC6WRggG1rE=
X-Received: by 2002:a05:6638:14d0:: with SMTP id l16mr9287388jak.142.1633728766086;
 Fri, 08 Oct 2021 14:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <CANpmjNMijbiMqd6w37_Lrh7bV=aRm45f9j5R=A0CcRnd5nU-Ww@mail.gmail.com>
 <YV8A5iQczHApZlD6@boqun-archlinux> <CANpmjNOA3NfGDLK2dribst+0899GrwWsinMp7YKYiGvAjnT-qA@mail.gmail.com>
 <CANiq72k2TwCY1Os2siGB=hBNRtrhzJtgRS5FQ3JDDYM-TXyq2Q@mail.gmail.com>
 <20211007185029.GK880162@paulmck-ThinkPad-P17-Gen-1> <20211007224247.000073c5@garyguo.net>
 <20211007223010.GN880162@paulmck-ThinkPad-P17-Gen-1> <20211008000601.00000ba1@garyguo.net>
 <20211007234247.GO880162@paulmck-ThinkPad-P17-Gen-1> <20211008005958.0000125d@garyguo.net>
 <20211008174048.GS880162@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20211008174048.GS880162@paulmck-ThinkPad-P17-Gen-1>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 8 Oct 2021 23:32:34 +0200
Message-ID: <CANiq72mOWV2SiF24E=NMB-zc2mK_UFH=CvDFxN+vdtyjy-Wm0A@mail.gmail.com>
Subject: Re: Can the Kernel Concurrency Sanitizer Own Rust Code?
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Gary Guo <gary@garyguo.net>, Marco Elver <elver@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Oct 8, 2021 at 7:40 PM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> Just in case there is lingering confusion, my purpose in providing an
> example from the field of safety-critical systems was nothing more or
> less than to derive an extreme lower bound for the expected bug rate in

Yes, safety-critical systems usually have lower rate of bugs, but they
can actually be very buggy as long as they comply with requirements...
:P

> production software.  Believe me, there is no way that I am advocating
> use of Rust as it currently exists for use in safety-critical systems!
> Not that this will necessarily prevent such use, mind you!  ;-)

Well, people are already working on bringing Rust to safety-critical domains! :)

In any case, for example, DO-178 describes the software development
process, but does not require a particular language to be used even if
a particular project following that standard may do so.

> From what I have seen, people prevent unsafe Rust code from introducing
> UB by adding things, for example assertions and proofs of correctness.
> Each and every one of those added things have a non-zero probability
> of themselves containing bugs or mistakes.  Therefore, a Rust program
> containing a sufficiently large quantity of unsafe code will with high
> probability invoke UB.
>
> Hopefully, a much lower UB-invocation probability than a similar quantity
> of C code, but nevertheless, a decidedly non-zero probability.
>
> So what am I missing here?

Rust does not guarantee UB-freedom in an absolute way -- after all,
there is unsafe code in the standard library, we have unsafe code in
the kernel abstractions, the compiler may have bugs, the hardware may
misbehave, there may be a single-event upset, etc.

However, the key is to understand Rust as a way to minimize unsafe
code, and therefore minimize the chances of UB happening.

Let's take an example: we need to dereference a pointer 10 times in a
driver. And 10 more times in another driver. We may do it writing
`unsafe` many times in every driver, and checking that every single
usage does not trigger UB. This is fine, and we can write Rust code
like that, but is not buying us much. And, as you say, if we keep
accumulating those dereferences, the probability of a mistake grows
and grows.

Instead, we could write an abstraction that provides a safe way to do
the same thing. Then we can focus our efforts in checking the
abstraction, and reuse it everywhere, in all drivers.

That abstraction does not guarantee there is no UB -- after all, it
may have a bug, or someone else may corrupt our memory, or the
hardware may have a bug, etc. However, that abstraction is promising
that, as long as there is no other UB subverting it, then it will not
allow safe code to create UB.

Therefore, as a driver writer, as long as I keep writing only safe
code, I do not have to care about introducing UB. As a reviewer, if
the driver does not contain unsafe code, I don't need to worry about
any UB either. If UB is actually introduced, then the bug is in the
abstractions, not the safe driver.

Thus we are reducing the amount of places where we risk using a
potentially-UB operation.

Cheers,
Miguel

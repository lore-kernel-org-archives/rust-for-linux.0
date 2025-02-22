Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4AE20C030
	for <rust-for-linux@vger.kernel.org>; Sat, 22 Feb 2025 18:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740249769; cv=none; b=buBV2XC9TFVy+ULeUw8BTdLBv1TSnnkPw+VMh08oAHOSCpc2Sty/eF/uiMNGeSaVUGO+T3P45oHEB/Ujwa+tojeuz70OopG+Q3WQqUBd/Wzkmpb/p4J1u2v9N9mJcJzYsJEstIBHJU7/fBj//n6t2VVN2vQ8U8Hym13FcpVyeak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740249769; c=relaxed/simple;
	bh=C3VVgceegZ24tig63EYv2teDL0e85OaPkzFlPQdOEzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pwP4Nr2KvoHvPY3HKUUOTOOZYMsexS74tDKaeKaQE4YzwptEGnZ0PWGgIa7b+0HYdSGXWewaOBJLZwEX1n+spYhGCDm2AU/MiazTou0Yif+fL3bLziV7De3z8jsiag2zZUbOe/ANyjDk2xTHm2IIE8ZV2mgiOldB6jDYGcam+nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=H3eL1nrY; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="H3eL1nrY"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5dedd4782c6so5963618a12.3
        for <rust-for-linux@vger.kernel.org>; Sat, 22 Feb 2025 10:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740249765; x=1740854565; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rsdKAvmn536U8u2tCivHSpv9Bw6Q/s3vxIyTuoPRJB0=;
        b=H3eL1nrY6flPjqs4Cyb2r0t6K7ta6TmKd7phUDuTYUT7fOpiOhd1RNnf8cXYzWkqkS
         LTyPi9Rcmd2ppUqMC4QLfpzqA82rczrmkTX25jlSLy5/XyUgWorCBQgGefLEeB9Xmh6L
         jIdHf5edJH60R8QAkBgkZiYNKJY1fk4UJashQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740249765; x=1740854565;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rsdKAvmn536U8u2tCivHSpv9Bw6Q/s3vxIyTuoPRJB0=;
        b=c/8HZZ0f2qOsSNpzH82Qav3K1Dh5L+Axb0wVTX2dqB9mcqEhsQvIp9+GNrZ5cl8lBB
         Q9Rya0my5MDEIdxyIAsOYt4aFK2gldhK5gsSKHomxfWGuBFDHzG8MhETXPDbpDIJZDp+
         wGhZDMNRcemQYngleZ2Mug4jj27sERsm+mvvku55HIlarp3f9UHQ48hvhNbeUdMWgKPV
         Id5dkwRWrHEeXkmfqUZg9fgmOgA1G6OkRJubqDMAfhyl6Yh4D5+3bUmyKEPxtBCwer16
         ybLVmFdccf914JsMga+J/CqTD0OLvE4WRqTxE+vidy2IIJJL8Eg25gqc3i6lEFOsRjjR
         N9Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUFhSXoS8OdJJbUc4hhDTll6XnYjNr+h4N1EukR6w70AMECtFvs5A2E8/E1SKnzqjHc/8BI7x0lLrnz1lcVPw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe66+taK5qr0v8o25Z6yVmSMX8Wn1zHU6O+CAmyamrMmzy7JbF
	VCEZxS5yXXTTKh0LVoL8o7kHf1j7LLWHkEb81sOp87zjzu5olmedJw1I9s8jthUVdO53/ptqAb3
	oAU4=
X-Gm-Gg: ASbGncvr4/q0XxIi7CUJEcb2SDrW5Mt3q+1BzBqfJtpnTHyH9OqFMc/XSXBDFFiMe10
	QDq9+gO7bZdAofD+HpyHEHOfqVI/2j931IgZ7D1jFz86N9D7KHVE8Vg/SXevr8IhpO4DLel8vcP
	edw1jHFhhhQY09cF8FXP9jFUFUj6BZZpHlRgy0YQONIPc08rqAfApZithvxncthr6QgjMptp46T
	6Wu/JdQpcy1KAfvnSjNYhlwQGcllRlZzXnw1HymOTeWtHgkFBlWWpqMsV7BepodJ08sIBAJ9bIy
	orsPv5x/JAE0bh3NE4m6m0he/atyTZjNNfZrH6OjLfdLXOf8KAzcDVmehArC8qbmkc6BUr0BmjV
	x
X-Google-Smtp-Source: AGHT+IGvz2FfEds3PPp1rp1pwRuBBV7VM5CdohLORf3QssZ5/YyqM//HJUJAB2FuTX0SvtCjxNEjOw==
X-Received: by 2002:a05:6402:4604:b0:5de:a6a8:5ecb with SMTP id 4fb4d7f45d1cf-5e0b70c9d72mr6783596a12.3.1740249764568;
        Sat, 22 Feb 2025 10:42:44 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e0a0310f66sm5165665a12.81.2025.02.22.10.42.40
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Feb 2025 10:42:43 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abb7f539c35so616689166b.1
        for <rust-for-linux@vger.kernel.org>; Sat, 22 Feb 2025 10:42:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWjnnOXXDxwkP8EPAZkBghim1HFaXiIej1LAGCZ1jIxzoB1+qbDX6R63s/fvArIb4ubtXFmgoG3aq5mFw2hMA==@vger.kernel.org
X-Received: by 2002:a17:907:6095:b0:ab7:e73a:f2c8 with SMTP id
 a640c23a62f3a-abc09a97a2cmr680413766b.26.1740249760479; Sat, 22 Feb 2025
 10:42:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <326CC09B-8565-4443-ACC5-045092260677@zytor.com>
 <CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com>
 <a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com> <Z7VKW3eul-kGaIT2@Mac.home>
 <2025021954-flaccid-pucker-f7d9@gregkh> <4e316b01634642cf4fbb087ec8809d93c4b7822c.camel@tugraz.at>
 <2025022024-blooper-rippling-2667@gregkh> <1d43700546b82cf035e24d192e1f301c930432a3.camel@tugraz.at>
 <2025022042-jot-favored-e755@gregkh> <b9a5de64fe1ded2ad3111763f35af9901bd81cc4.camel@tugraz.at>
 <caea3e79-78e6-4d98-9f3b-f8e7f6f00196@stanley.mountain> <61a7e7db786d9549cbe201b153647689cbe12d75.camel@tugraz.at>
 <20250221124304.5dec31b2@gandalf.local.home> <CAHk-=wgg2A_iHNwf_JDjYJF=XHnKVGOjGp50FzVWniA2Z010bw@mail.gmail.com>
 <6b3e4d3bdc9b6efd69068e5b22cfd05d370aed19.camel@tugraz.at>
 <CAHk-=wg=pZvE9cHJUPKGCajRUCtDoW73xwY5UfJApCWms_FgYw@mail.gmail.com> <20250221172415.5b632ae6@gandalf.local.home>
In-Reply-To: <20250221172415.5b632ae6@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 22 Feb 2025 10:42:23 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjQCbRA1UEag-1-9yn08KNNqerTj++SCbbW80At=rg5RQ@mail.gmail.com>
X-Gm-Features: AWEUYZlg8oWe1F8d2yA0IbMiP2eFfVc-xiIEw7rs2Mbp7C_9_vUVmvUaGEwld1M
Message-ID: <CAHk-=wjQCbRA1UEag-1-9yn08KNNqerTj++SCbbW80At=rg5RQ@mail.gmail.com>
Subject: Re: Rust kernel policy
To: Steven Rostedt <rostedt@goodmis.org>, Jens Axboe <axboe@kernel.dk>
Cc: Martin Uecker <uecker@tugraz.at>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Greg KH <gregkh@linuxfoundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Feb 2025 at 14:23, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> If I could just get a warning for this stupid mistake:
>
>         size_t ret;
>
>         ret = func();
>         if (ret < 0)
>                 error();
>
> I'd be very happy.

I really don't think the issue here should be considered "ret is
unsigned, so checking against zero is wrong".

Because as mentioned, doing range checks is always correct. A compiler
must not complain about that. So I still think that the horrid
"-Wtype-limits" warning is completely misguided.

No, the issue should be seen as "you got a signed value, then you
unwittingly cast it to unsigned, and then you checked if it's
negative".

That pattern is "easy" to check against in SSA form (because SSA is
really a very natural form for "where did this value come from"), and
I wrote a test patch for sparse.

But this test patch is actually interestign because it does show how
hard it is to give meaningful warnings.

Why? Because SSA is basically the "final form" before register
allocation and code generation - and that means that sparse (or any
real compiler) has already done a *lot* of transformations on the
source code. Which in turn means that sparse actually finds places
that have that pattern, not because the code was written as an
unsigned compare of something that used to be a signed value, but
because various simplifications had turned it into that.

Let me give a couple of examples. First, the actual case you want to
find as a test-case for sparse:

   typedef unsigned long size_t;
   extern int fn(void);
   extern int check(void);

   int check(void)
   {
        size_t ret = fn();
        if (ret < 0)
                return -1;
        return 0;
   }

which makes sparse complain about it:

    t.c:8:19: warning: unsigned value that used to be signed checked
for negative?
    t.c:7:24: signed value source

Look, that's nice (ok, I notice that the "offset within line" fields
have regressed at some point, so ignore that).

It tells you that you are doing an unsigned odd compare against zero
of a value that *used* to be signed, and tells you where the value
originated from.

Perfect, right?

Not so fast.

It actually doesn't result in very many warnings in the current kernel
when I run sparse over it all, so on the face of it it all seems like
a nice good safe warning that doesn't cause a lot of noise.

But then when looking at the cases it *does* find, they are very very
subtle indeed. A couple of them look fine:

    drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c:455:26: warning:
unsigned value that used to be signed checked for negative?
    drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c:452:35: signed value source

which turns out to be this:

        unsigned int brightness = bl_dev->props.brightness;
        ...
        if (brightness < S6E3HA2_MIN_BRIGHTNESS ||
                brightness > bl_dev->props.max_brightness) {

and that's actually pretty much exactly your pattern: 'brightness' is
indeed 'unsigned int', and S6E3HA2_MIN_BRIGHTNESS is indeed zero, and
the *source* of it all is indeed a signed value
(bl_dev->props.brightness is 'int' from 'struct
backlight_properties').

So the warning looks fine, and all it really should need is some extra
logic to *not* warn when there is also an upper bounds check (which
makes it all sane again), That warning is wrong because it's not smart
enough, but it's not "fundamentally wrong" like the type-based one
was. Fine so far.

And the sparse check actually finds real issues:

For example, it finds this:

    drivers/block/zram/zram_drv.c:1234:20: warning: unsigned value
that used to be signed checked for negative?
    drivers/block/zram/zram_drv.c:1234:13: signed value source

which looks odd, because it's all obviously correct:

        if (prio < ZRAM_PRIMARY_COMP || prio >= ZRAM_MAX_COMPS)
                return -EINVAL;

and 'prio' is a plain 'int'. So why would sparse have flagged it?

It's because ZRAM_PRIMARY_COMP is thgis:

        #define ZRAM_PRIMARY_COMP 0U

so while 'prio' is indeed signed, and checking it against 0 would be
ok, checking it against 0U is *NOT* ok, because it makes the whole
comparison unsigned.

So yes, sparse found a subtle mistake. A bug that looks real, although
one where it doesn't matter (because ZRAM_MAX_COMPS is *also* an
unsigned constant, so the "prio >= ZRAM_MAX_COMPS" test will make it
all ok, and negative values are indeed checked for).

Again, extending the patch to notice when the code does a unsigned
range check on the upper side too would make it all ok.

Very cool. Short, sweet, simple sparse patch that finds interesting
places, but they seem to be false positives.

In fact, it finds some *really* interesting patterns. Some of them
don't seem to be false positives at all.

For example, it reports this:

    ./include/linux/blk-mq.h:877:31: warning: unsigned value that used
to be signed checked for negative?
    drivers/block/null_blk/main.c:1550:46: signed value source

and that's just

                if (ioerror < 0)
                        return false;

and 'ioerror' is an 'int'. And here we're checking against plain '0',
not some subtle '0U' thing. So it's clearly correct, and isn't an
unsigned compare at all. Why would sparse even mention it?

The 'signed value source' gives a hint. This is an inline, and the
caller is this:

                cmd->error = null_process_cmd(cmd, req_op(req), blk_rq_pos(req),
                                                blk_rq_sectors(req));
                if (!blk_mq_add_to_batch(req, iob, (__force int) cmd->error,
                                        blk_mq_end_request_batch))

iow, the error is that 'cmd->error' thing, and that is starting to
give a hint about what sparse found. Sparse found a bug.

That '(__force int) cmd->error' is wrong. cmd->error is a blk_status_t, which is

        typedef u8 __bitwise blk_status_t;

which means that when cast to 'int', it *CANNOT* be negative. You're
supposed to use 'blk_status_to_errno()' to make it an error code. The
code is simply buggy, and what has happened is that sparse noticed
that the source of the 'int' was a 8-bit unsigned char, and then
sparse saw the subsequent compare, and said "it's stupid to do a 8-bit
to 32-bit type extension and then do the compare as a signed 32-bit
compare: I'll do it as a unsigned 8-bit compare on the original
value".

And then it noticed that as an unsigned 8-bit compare it made no sense any more.

Look, ma - it's the *perfect* check. Instead of doing the
(wrongheaded) type limit check, it's doing the *right* thing. It's
finding places where you actually mis-use unsigned compares.

No. It also finds a lot of really subtle stuff that is very much
correct, exactly because it does that kind of "oh, the source is a
16-bit unsigned field that has been turned into an 'int', and then
compared against zero" and complains about them.

And usually those complaints are bogus, because the "< 0" is important
in inline functions that do range checking on values that *can* be
negative, but just don't happen to be negative in this case because
the source couldn't be negative and earlier simplifications had turned
a signed compare into an unsigned one, so it now talks about that.

Oh well.

I'm adding Jens to the cc, because I do think that the

    drivers/block/null_blk/main.c:1550:46: signed value source

thing is a real bug, and that doing that (__force int) cmd->error is
bogus. I doubt anybody cares (it's the null_blk driver), but still..

I also pushed out the sparse patch in case anybody wants to play with
this, but while I've mentioned a couple of "this looks fine but not
necessarily relevant" warnings, the limitations of that patch really
do cause completely nonsensical warnings:

    git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/sparse.git
unsigned-negative

Not a ton of them, but some. bcachefs actually gets a number of them,
it looks like the games it plays with bkeys really triggers some of
that. I'm almost certain those are false positives, but exactly
because sparse goes *so* deep (there's tons of macros in there, but it
also follows the data flow through inline functions into the source of
the data), it can be really hard to see where it all comes from.

Anyway - good compiler warnings are really hard to generate. But
-Wtype-limits is *not* one of them.

               Linus

Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BEDEB64D9
	for <rust-for-linux@archiver.kernel.org>; Sat, 17 Jun 2023 16:04:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjFQQE6 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 17 Jun 2023 12:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbjFQQE5 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 17 Jun 2023 12:04:57 -0400
Received: from out-8.mta1.migadu.com (out-8.mta1.migadu.com [IPv6:2001:41d0:203:375::8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6169610E0
        for <rust-for-linux@vger.kernel.org>; Sat, 17 Jun 2023 09:04:55 -0700 (PDT)
Date:   Sat, 17 Jun 2023 12:04:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1687017891;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SztXBdkQlbXnmsEaFravD4BBS1Lb+CEReDCBmvg66lk=;
        b=xul8r4n3tOMBjg2b397tAYQGd6ZlYsPtVKfOHZYxL0bxetqNhM4ak5O/x4hUOwekdcKK7j
        PMXnTBcZ6XSLoUi0Ol+ZRlIluQp06I0J4VdYRyVVybMX+BRhIZn/gepDXbTfH9UQWMC2za
        ANkh6zijHLmFtl5EiMzMcAkI+8XrFg8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Kent Overstreet <kent.overstreet@linux.dev>
To:     Ariel Miculas <ariel.miculas@gmail.com>
Cc:     Ariel Miculas <amiculas@cisco.com>, rust-for-linux@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>, sviatoslavpestov@gmail.com,
        dwrenshaw@gmail.com, temporal@gmail.com
Subject: Re: [PATCH 31/80] rust: serde: add SPDX License Identifiers
Message-ID: <ZI3ZnFk2uELYFX0R@moria.home.lan>
References: <20230609063118.24852-1-amiculas@cisco.com>
 <20230609063118.24852-32-amiculas@cisco.com>
 <ZIPDCGM9HbPhR2yW@moria.home.lan>
 <CAPDJoNuLfNWBqem7cD+vppfgg-3uBDQ9hnqJfAJEHev8fHnHyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPDJoNuLfNWBqem7cD+vppfgg-3uBDQ9hnqJfAJEHev8fHnHyA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Jun 15, 2023 at 06:05:47PM +0300, Ariel Miculas wrote:
> On Sat, Jun 10, 2023 at 3:29 AM Kent Overstreet
> <kent.overstreet@linux.dev> wrote:
> >
> > On Fri, Jun 09, 2023 at 09:30:29AM +0300, Ariel Miculas wrote:
> > > From: Miguel Ojeda <ojeda@kernel.org>
> > >
> > > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> > > ---
> > >  rust/serde/de/format.rs         | 2 ++
> > >  rust/serde/de/ignored_any.rs    | 2 ++
> > >  rust/serde/de/impls.rs          | 2 ++
> > >  rust/serde/de/mod.rs            | 2 ++
> > >  rust/serde/de/seed.rs           | 2 ++
> > >  rust/serde/de/utf8.rs           | 2 ++
> > >  rust/serde/de/value.rs          | 2 ++
> > >  rust/serde/integer128.rs        | 2 ++
> > >  rust/serde/lib.rs               | 2 ++
> > >  rust/serde/macros.rs            | 2 ++
> > >  rust/serde/private/de.rs        | 2 ++
> > >  rust/serde/private/doc.rs       | 2 ++
> > >  rust/serde/private/mod.rs       | 2 ++
> > >  rust/serde/private/ser.rs       | 2 ++
> > >  rust/serde/private/size_hint.rs | 2 ++
> > >  rust/serde/ser/fmt.rs           | 2 ++
> > >  rust/serde/ser/impls.rs         | 2 ++
> > >  rust/serde/ser/impossible.rs    | 2 ++
> > >  rust/serde/ser/mod.rs           | 2 ++
> > >  rust/serde/std_error.rs         | 2 ++
> > >  20 files changed, 40 insertions(+)
> >
> > Separately from that - are we sure we want to be pulling Serde into the
> > kernel?
> >
> > Don't get me wrong, Serde is amazing - it's highly ergonomic, and makes
> > a lot of compatibility issues just completely go away. It's
> > impresssively well done.
> >
> > But it's a full json parser (are you using it in json mode here? it
> > supports multiple formats), and object size is going to be a
> > consideration. In particular, the way it works is by generating (via
> > procedural macros) encode/decode functions for every type you use
> > #[derive] an encoder/decoder for, so depending on how that was
> > implemented that's going to add up.
> >
> > I would need to see text size numbers - the bloaty tool might be
> > useful here: https://github.com/google/bloaty
> >
> > I'd give serious consideration to Cap'n proto instead, it's not as
> > ergonomic as Serde (the get/set interface is not ideal, ask me for more
> > details on how this could be fixed) but it's lower overhead than Serde.
> I've been checking out Cap'n proto and indeed that get/set interface
> seems cumbersome, so how do you fix it?

One thing that makes it cumbersome is that any get can return an error:
a straightforward change would be to add a method that does all
validation/bounds checking up front, and returns a new type with methods
that can't return errors.

Kenton did it that way to avoid any O(n) parsing overhead up front;
with messages that can be arbitrarily sized it's definitely an option
that you want to have, especially when you won't necessarily be reading
the entire thing. But in my experience most messages are short, and
there's a reading-off-the-disk step or reading-from-the-network step,
and you probably want to do other validation, so doing all validation up
front simplifies error handling.

For the next step, what we really what we'd want is for cap'n proto to
generate normal Rust types but with a #[repr] that matches the cap'n
proto type layout.

Having the cap'n proto compiler emit #[repr(c)] types with the
appropriate padding isn't enough because:
 - integers are stored little endian, and need byte swabbing to access
 - booleans are stored as bitfields, and Rust doesn't have native
   bitfields

Doing this right would require importing computed properties from Swift:
a computed property is something that looks like a struct field but
requires get/set calls to access it, the compiler just knows how to emit
them.

Miguel might be able to point us towards rustc people to talk to about
this :) Having native language-level types which are directly
serializable is amazing, as we've already seen with Serde. If we could
skip the encode/decode step and just mmap a file and start walking
objects - this could really change how we write and design filesystems,
databases - even compilers. Debug info (e.g. dwarf) is all about
serializing compiler internals, and a lot of the problems compiler
people are tackling right now basically require doing this in a more
principled way.

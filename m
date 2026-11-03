Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793723142;
	b=YeGq0/NLi7OKPcR8qwhR7MK9FYYb2x42QGoz7bDD3AUwZFxd5EkMHmPvwmrOzNZjeHUv
	 xiY0ncyvdU/zFw4tzfu9p/ToVh/kqAjQQJXVWzuglkl3ejrIMkLGstNbCROOOLaTAMqIN
	 JVM9lMCpsWBLpvTd0ngwtJ4dF/TIuEBXEZmF4Oz76M5uxMSA1v69/lxdVXEZrY0xB/ash
	 Tnli3kYFo1/Bg6DnZHETLR/QSeYgEP9naZ+vfIkd0e8A/8rMXVZvAecz39FN6l0ZLJYji
	 8uPY7fu6ExgsvGSns/8Qf1786ulbi7N7nULJV/YdyBqvjjfAi/sAnuZpaXynIEN6LeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ucTwJsfrEI4hG4ToLcJXFo+0eiVcR5dBAvRyAcGuUSQ=;
	b=wUvmHFNhK9b2y5de52pa9aBDZ3QWES9fjkmSA8+31Tt5/yFgqykCLjo0luyFRB6ylmlg
	 rEBEESj1cBYFOJ7MNeCT10NpuxiJ+c/Fs722npEMSnyIwSy5dJzRxMIHBBkgQD2kofAhT
	 cZDKl4P3hChjX7K4+8Wp92P+wsgWc/Y5rNH+TBa/LBLmqLl1Sl8T0hb1mz6KrCqYDvnVk
	 WXwHcZD1O6Emzov3VayqD4Q4jhT/3KMk+cGz/zLibZa+ki57tq8/DrhbKrt3yB8kERuRJ
	 MNCqa7qE1DkufFWRI3o5adUS5FegUlbOszb5Fb5qdayJXoF+Dz7iD6DJ+IqzIVgx0BA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cUIIDOwS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BAF606A326
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 16:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58BAF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cUIIDOwS
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-533202fe429so333731cf.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 08:25:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793723141; cv=none;
        d=google.com; s=arc-20260327;
        b=hQp0BuC2Ey5pn4GVQUw4QHYblEu/B/RijgNwB83TUAyryi1X0jeKTxdq8AkrE90AtU
         JTiv5F4Y1AuazkljnhAVnaUTyNpUy3FuzJnPiaZFUKAn4sFTKXxbw/Lze9j4NC9MK8Gn
         3HPkbxuz3FBKfA1/1SVD3Fdrn9lBxcV3hzUsXRu8sEgy+KSHjuKsw0u3vxrM96/l3UJi
         dxfmYf0FG3w4nhVOryUBj/BhPIeM2rE3XbVRYLWuwQA236M9SKEX7CqUOTMUzwigvubJ
         lrGy6oehgaY4Yyeq5Vn3N+j7UY+i4wiIHhpZ9ULH6ax77u2RZ1RS0nKUFbCxnIkTR2tM
         /tpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ucTwJsfrEI4hG4ToLcJXFo+0eiVcR5dBAvRyAcGuUSQ=;
        fh=hCUm/KHSV8Og5vcVSgsP67jFeySfI2keks/+FS5x0A4=;
        b=h760BydZpBWffa0/oyzbznXcfE84UXa/qK9dszn+nR9K4vEAjmDwkKACwEN/3u4F/r
         EvtNrVzuf0HHsjKcEgBlO0ZOpXNfNsRQfdp1S3PhY6GU1AyLTO9wZ+XgxfFL8p8Mh4KT
         ZRUdZP9GsxT2toRnumAm6RfhB/NQRC7G2jrLBq0xxkXc4cl3Ga9p0gYOUJUVTrGIT0gb
         m5+4zCWZml/CbpPcxZ7UHCE9iOLBc9uUxxv0jSVpp1RJjy6FunCumayZww9+D7KymYvB
         w0yn8+lnFLvtybMmGqYrGIACO37hW8STxHPw/BiGL5CuRxP6pAmzwg4xFa8Wc35xH6Bx
         jRSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793723141; x=1794327941; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ucTwJsfrEI4hG4ToLcJXFo+0eiVcR5dBAvRyAcGuUSQ=;
        b=cUIIDOwSgEY4sB/0Tg2p1iGB8ZqP+oT+zRWYbpJ5HDp4fFkm+00ZhLSRbuR1w60LEW
         v/5VgDjhNdTrk7C+It+m9RQlpHOPBKKJ8MIFzOSFtB8x1OyuG4X2s3u4rRoZu/ZfFV5H
         Kazq+csKerHRwdWninAXLvUt+3O5h/nVEi5AXCOF9iT+3xZCeU/uPt7XR77RdCWH5NRW
         TLTC2oJxRgwsHEhfTzkjustTzb6f8S34Z27msGHq4tfZ24CS8qYD+kcafFVm7P7Bd23S
         at6fseXnLSYGGN2I2uY6DnwYEb7hDJvQTMUDsN2LGq54ItEStcbdIx6aQJO2F6al54hU
         E0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723141; x=1794327941;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ucTwJsfrEI4hG4ToLcJXFo+0eiVcR5dBAvRyAcGuUSQ=;
        b=WJ1wY22S6bw42c4jUZ3auQD2pJsq/LTSW4j5BSKtJR7UjtoVrvO/srYZuGrPFcFhIT
         tLcNUJMkamJbL6ndpfbxYNFxe9EHj79WuGEQ5Pn0Q2GZLiSHcUN0QsHn3lfFt77lcUOU
         IwkkQ94Y6T82JUrz9JcLwGGoLCTQBs4YLUcXUr2gkNg1+9/VmFANHKiGAS+VsgVTD+rB
         X3XeowYJUrUbZ+8hIdALI4XyeFf/wyLIs8QNvo4a5q3rkpiWdGA3HJ2hQB9M4m1tKq9O
         TIQnZ7LACiUDvRxJg+VIGcZ9EGG63SdbYuT/6NC9UmucaHgCy02T8V1NnLLHazuYQ6ew
         DJjA==
X-Forwarded-Encrypted: i=1; AKwUvBxzD+qidpWvNLlLKxA+Y8hnOSe8IBKaQPY9biWlcxWcVUwJOeWFqDh9RCb9J+PDYshI3wAsK9tX2RbT1zp1eQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ztYnLywX4PRudxAoznBtuqIX3HLElFB76AOrlO9K/Honb/ojY
	prv61auHZ5XO7uIvt2H1wlH7lbPHY+s+sicDLAi9o0Zd/wflQhL03/yoQS9AMIPZzwTJHDL3HtF
	LbGLT8QkOTa+q5CYSprSihd6cjznCeKINmdibUhou
X-Gm-Gg: AYBFou0y39BJqU0AFLhhfEMbRIJjEFed1eq0f+AE1PjYHaivbDK2+5KlTH1nFUNAgmc
	9xA0zyF06j7eTZ+8UeOK/eX58adh16Jl0YGXKHTCghxb5EPObZydl+9ulCEEwhHFxl7jEZdlBhn
	mbA7mtn5QRQNwsNCjzg06ZtYq1FUKcziaxkS36vAU2x4tcd8SDieHxofq+FaweUUfv96hRFlgIG
	HvjCHIkIT3mwxbwQ8ZM2I4EBBHCTYW6HOp8Tk/XdnNYpD0sqteWXdWojRR1nMHosgclzgvO0uT0
	mmEbYYLIVdKbdj+zThcU7VCFhp1vdL4jvPAk5LSNvhftHb9JYtOFp9H2tcJg6WZxyhud8Qko335
	yBqN+uMrp80f7jP/g/RO6VhArHX879xzGPR4556LHjy7izbqvGNOMM1bi6eokhvCjFRc=
X-Received: by 2002:ac8:5cca:0:b0:536:934f:7da2 with SMTP id
 d75a77b69052e-549ba517bd1mr23041891cf.2.1793723140630; Tue, 03 Nov 2026
 08:25:40 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022134617.228229-1-gprocida@google.com> <20261103125814.258105-2-gprocida@google.com>
 <0ddac462-b4b3-4844-8a00-fbe5f043885c@suse.com>
In-Reply-To: <0ddac462-b4b3-4844-8a00-fbe5f043885c@suse.com>
From: Giuliano Procida <gprocida@google.com>
Date: Tue, 3 Nov 2026 16:25:02 +0000
X-Gm-Features: AclHuK-6CCPIkFp5_oqua3MDBxS7jekauX_rpV7FSKbhPTEfW6LwwMQZwtaQ9bA
Message-ID: <CAGvU0Hm04LXTywU0eL6KN4=SoOAC+LU3BKqENnLR-WV-sHsuNA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: move EXPORT_SYMBOL_RUST_GPL to include/linux/export.h
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-modules@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Nov 2026 at 15:57, Petr Pavlu <petr.pavlu@suse.com> wrote:
>
> On 11/3/26 1:58 PM, Giuliano Procida wrote:
> > diff --git a/scripts/misc-check b/scripts/misc-check
> > index 40e5a4b01ff4..b39d731cb413 100755
> > --- a/scripts/misc-check
> > +++ b/scripts/misc-check
> > @@ -45,7 +45,7 @@ check_tracked_ignored_files () {
> >  # does not automatically fix it.
> >  check_missing_include_linux_export_h () {
> >
> > -     git -C "${srctree:-.}" grep --files-with-matches -E 'EXPORT_SYMBOL((_NS)?(_GPL)?|_FOR_MODULES)\(.*\)' \
> > +     git -C "${srctree:-.}" grep --files-with-matches -E 'EXPORT_SYMBOL((_RUST)?(_NS)?(_GPL)?|_FOR_MODULES)\(.*\)' \
> >           -- '*.[ch]' :^tools/ :^include/linux/export.h |
> >       xargs -r git -C "${srctree:-.}" grep --files-without-match '#include[[:space:]]*<linux/export\.h>' |
> >       xargs -r printf "%s: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing\n" >&2
> > @@ -58,7 +58,7 @@ check_unnecessary_include_linux_export_h () {
> >
> >       git -C "${srctree:-.}" grep --files-with-matches '#include[[:space:]]*<linux/export\.h>' \
> >           -- '*.[c]' :^tools/ |
> > -     xargs -r git -C "${srctree:-.}" grep --files-without-match -E 'EXPORT_SYMBOL((_NS)?(_GPL)?|_FOR_MODULES)\(.*\)' |
> > +     xargs -r git -C "${srctree:-.}" grep --files-without-match -E 'EXPORT_SYMBOL((_RUST)?(_NS)?(_GPL)?|_FOR_MODULES)\(.*\)' |
> >       xargs -r printf "%s: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present\n" >&2
> >  }
> >
>
> This is minor, but the updated pattern matches non-existent
> EXPORT_SYMBOL() variants. To preserve the current strict matching, it
> should instead be changed to:
>
> EXPORT_SYMBOL((_NS)?(_GPL)?|_FOR_MODULES|_RUST_GPL)\(.*\)

I'll take this suggestion which was also my initial thought.

My second thought was that if Linux were ever going to allow non-GPL
or namespaced
Rust symbols, the syntax I came up with would be the best future-proofing.

> Alternatively, I think the pattern could be made more permissive in
> general, something like:
>
> EXPORT_SYMBOL(_[A-Z_]+)?\(.*\)
>
> This has the advantage of not requiring changes when a variant of
> EXPORT_SYMBOL() is added/removed and shouldn't sacrifice any of the
> desired functionality.

AI analysis: Using a permissive regex in check_missing_include_linux_export_h
introduces 81 to 84 false-positive warnings across the kernel.

Things like: EXPORT_SYMBOL_IF_KUNIT, EXPORT_SYMBOL_ACPI_LIB.

> -- Petr

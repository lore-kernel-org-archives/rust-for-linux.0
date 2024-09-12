Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374FB13D25E
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Sep 2024 16:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726157220; cv=none; b=hqHCarPko4I/mtLf0E57XvnJ6/FGO0xrRX8o6sUafVyvW5hGfYu7ZQeojs1gFg5hY4vHkTdoxvPCfGgKf0gs5zCrW3bZzYD2hImVFRras4EheyR3od/Q9vy1oAHHAChfipVg6iebm/Q17UwcCis/WYwZfMSC5suMIpHQyOiHWuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726157220; c=relaxed/simple;
	bh=IT1o82vxgKP1FGlb30UH98pNclOmxQrMnkN0OFaimUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R7m/wXWMuoAIrY7/D3XPeXF7heXpghEG/bYzq2g0pySPfHKht67woog/cbG0tmIewm8yCkLvRrUPu/SgO63Xls7DNTA3qd30kym0sjuFJHWD6RujeGwsmzoZ2FCysXEyMBhRGozLaLhFb1sq8vXDF3EmLCHc4zOCX8TRP45JUJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ywMov3Oq; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ywMov3Oq"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4582a5b495cso249771cf.1
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Sep 2024 09:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726157218; x=1726762018; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omr6m6gliwPRufxamwdCTWNYYmJ3FITHC3JRHgUinPo=;
        b=ywMov3OqjGZmpPHa1Bxchdlu3MGugCjbPAoPpbL69/JGHT8Ul+Zt/qswuWWoBrnWW3
         iXp4ueDFPpdqA06vL6FxdbmjTFcN2+m9xgF5DIaJ6h+9XETGRgzt2JkrcTMQOS9MjXyi
         e32tvykhQ3roJ7/Wphhah1DsVPl8vnc8jcHbC3Xb+SphmzuwOzgXjtobZJCTVKyPjn5i
         7lFCy5rmCmnbfznwNJVbB5Py70zMj6UBzqw0lI9psdXvPj02Nhnvq5ONvQYDdwrQ9Pn8
         UZ+nuRzJRlUEBmb2++OvqIFz4fZZsHBJozyDdj0LQmuh7qPySniuOjGToTo/eGjC1aRQ
         v8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726157218; x=1726762018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=omr6m6gliwPRufxamwdCTWNYYmJ3FITHC3JRHgUinPo=;
        b=pWFGAjTFK6Umxees+NMy0wr1swdzUU2YWSOIBYzzjju5jMOrivFzP49xoh4WXS2iUn
         bxkTdBF2ytubA1pMu21U3b5Ut0h7VavaCdNTY3C3q1gl9jE5vW1OxSkwcXBZ4THvt9wl
         dDenWNFjUNQvqoJpHBicux/O3OslIsa4hTHJt/XIC3BzVrhbwTqaf3zgBy0h/PBAcoLW
         Bt4qS6VPr5GJ2N5lElhznY1yuZgXKyatwjZwHbgQhDCrLj+psL3LMuudC8EUsn/ywtcW
         YT3y0jf2p1FCldiESWCWinCH5abuvzlYi4Xxl5QxKn9DkiyuUr7qRv3bvx6nQ5oerMn5
         8W/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqHa4ISPLzq00hQNpkmI+tDrS3n1BhYGBJR8qSCYr/3bYWHdMJahi/6WwTNWjbvOXwKxkP4Ytg2U0MvxSs9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzP/MHIvSmX1rPO5qGZAvTzS9iPYdhnYBQb/7DEV2oXvXYrf70P
	04lguQieEW4jeWtgZfvTQdD35OtHt5lOI9KgmPTdixjzQznU9JuGyr0hd+IZX0fHcnMXgz3JtH4
	SjB5O5BclANoYbCEoQRhAvqUs/8g8y5qTHYH4
X-Google-Smtp-Source: AGHT+IGOGPADRaVpGoTSHr0PDggkgl8HZXldTfXyU/ZgwZHpTw+qG9d8tMyjvXLDA0IIjRFc4gXxPJ5tunVOQkpfzMo=
X-Received: by 2002:a05:622a:198b:b0:447:e0a6:9163 with SMTP id
 d75a77b69052e-458607b265amr3217081cf.14.1726157217773; Thu, 12 Sep 2024
 09:06:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-37-samitolvanen@google.com> <alpine.LSU.2.21.2408301114000.1124@pobox.suse.cz>
 <CABCJKucCWfeC0yL6Q2ZcBfef0tMd9L_gmHRJt-cUYkg_4PDtnA@mail.gmail.com> <599892ec-3cf5-4349-984b-7c94f2ba5687@suse.com>
In-Reply-To: <599892ec-3cf5-4349-984b-7c94f2ba5687@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 12 Sep 2024 09:06:19 -0700
Message-ID: <CABCJKuer=O3FnLJNGMg2+-HxFJFUrccTuuHt5OiMpRsAJBvBsg@mail.gmail.com>
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved
 structure fields
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Miroslav Benes <mbenes@suse.cz>, Masahiro Yamada <masahiroy@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 4:43=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> On 8/31/24 02:05, Sami Tolvanen wrote:
> > On Fri, Aug 30, 2024 at 9:34=E2=80=AFAM Miroslav Benes <mbenes@suse.cz>=
 wrote:
> >>
> >> yes, this is one of the approaches we use in SLES. We add kabi padding=
s
> >> to some structures in advance (see [1] as a random example) and then u=
se
> >> it later if needed.
> >>
> >> It is not the only approach. Much more often we do not have a padding =
and
> >> use alignment holes ([5]), addition of a new member to the end of a
> >> structure ([2] or [3]) and such "tricks" ([4] for a newly fully define=
d
> >> structure).
> >
> > Thanks for bringing this up! Sounds like we're also going to need a
> > way to completely exclude specific fields from the output then. I
> > think we can use a similar union approach, but instead of instructing
> > the tool to use another type, we can just indicate that the field
> > should be skipped. I'll come up with a solution for v3.
>
> It might have been mentioned previously, not sure, but one more case to
> consider is handling of enum declarations. New enumerators can be
> typically added without breaking ABI, e.g. 'enum E { OLD1, OLD2, NEW }'.
> It would be then great to have some ability to hide them from
> gendwarfksyms.
>
> I think neither of the __kabi_reserved or __gendwarfksyms_declonly
> mechanism can currently help with that.

I thought about this a bit and I wonder if we need a separate
mechanism for that, or is it sufficient to just #define any additional
hidden values you want to add instead of including them in the enum?

  enum e {
      A,
      B,
  #define C (B + 1)
  #define D (C + 1)
  };

Do you see any issues with this approach? I think Clang would complain
about this with -Wassign-enum, but I'm not sure if we even enable that
in the kernel, and as long as you don't overflow the underlying type,
which is a requirement for not breaking the ABI anyway, it should be
fine.

Sami

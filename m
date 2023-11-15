Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="L0ZFwWAA"
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62CF1197
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Nov 2023 13:55:12 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5afbdbf3a19so983367b3.2
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Nov 2023 13:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1700085311; x=1700690111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUq545v7/AFWdO3s2cbQedSmJfD35I6jv2jV0AQhfh8=;
        b=L0ZFwWAAXKvUPAaRv0LlnKH+wfIv+UvaFAtlNy65VwS4cXV0Q4eC8Ja3u60kW9+mcl
         ZNyf+bywQCU5mGUxrLbIBgXDAr/uRzmh0oja7luLZqSZ0woFSyPJCeQvKhVAw0KmF07K
         aE595f86xlpXqvdTzIVSNsO6AfBxEO1WOQff7a+6Zcd7va4+e2K2CC+hdJPbY5uJ1/2b
         Bvufb3rd+n9k8KWMorN++KG90operFg8hV67Yd1Ba/AO2JTp3RoRYl8tUdyM2+i4w0Sz
         ZQ0K36kIrBj1UDi82dbgFWaWhroCAwPPkxO1gzas9udGCJVW4P9Gd/9pERAKgdwlvS4S
         5yww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700085311; x=1700690111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CUq545v7/AFWdO3s2cbQedSmJfD35I6jv2jV0AQhfh8=;
        b=ah/dvT7GiyPTDYNcpMpEdw5eC7fiCHYJUUvDr/Kzf+iMsqTggfeRBqdZHlPzLcaWS8
         dZ780uKuUmWnbJaZ6U/AErKWp7psXe0itr+q1LKImZMOFVgPLiUOo6gYhOr21wOKUhWC
         bMo7tAreo/8H/Y5lNhl/a+o4hW71xuoEnS43DonyUAJAZSmKhFiqYGI5ed7TFIn1C60O
         cyx5GRu49gMxVbwhCKY2pA8AhhEtgBVlTI3ykO0k+BvqfeGsLkOKJLCylqL89HQE7S/W
         RJciUq2xGl7hP4ZrnMdyGLkFUNTl4dV8GueX2mROhE2Qxkd//2ByI5U2CH3HI6eVv+qF
         OTZg==
X-Gm-Message-State: AOJu0Yw+QKXKXthcrj6ss0XDAJEbOmxixwGo+ykS4iaAJh5JlOKxQuyj
	Eq7cU4uG6TcqFBeLfEdnM9eZQHZ7rZ1jZ6L+DMYD5g==
X-Google-Smtp-Source: AGHT+IGkTlfVHtu57X2UgwUbJEe510KnlsYZpQcsqr40W+isOuklIW5nspCjer/9200mY+BlzNeYTyt3O8hmubJkKUM=
X-Received: by 2002:a0d:f347:0:b0:5be:a458:1f37 with SMTP id
 c68-20020a0df347000000b005bea4581f37mr16027566ywf.16.1700085311608; Wed, 15
 Nov 2023 13:55:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231115185858.2110875-1-mmaurer@google.com> <CALNs47vtOJ8WcykEtXn==Fn77sqRt9nzPDek-c+625HPfWSx2A@mail.gmail.com>
 <CAGSQo01pE=V+NCdgp-1r_PAfn_48D4yXb91spHf8cZA0Z7GoLA@mail.gmail.com> <CAGSQo03pseM9ypkOZuX4UrHN=6kdBRq6a1sGH-T_T6WrOFgXzg@mail.gmail.com>
In-Reply-To: <CAGSQo03pseM9ypkOZuX4UrHN=6kdBRq6a1sGH-T_T6WrOFgXzg@mail.gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 15 Nov 2023 16:54:59 -0500
Message-ID: <CALNs47suPEkRUzPAmYOJ2t_CCeLBAdbehs=FexL-6--68=KgdA@mail.gmail.com>
Subject: Re: [PATCH 0/3] MODVERSIONS + RUST Redux
To: Matthew Maurer <mmaurer@google.com>
Cc: gary@garyguo.net, masahiroy@kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 4:24=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> Should I be sending all these patches to all the lists? I was trying
> to follow the recommendations of get_maintainers.pl, which thought
> modules were the only relevant folks for the export_modules patches.
> (I also added Gary + Masahiro explicitly due to their involvement with
> the previous approach.)
>
> If I should be sending all the patches to all the lists, should I also
> be adding all the suggested To/Cc lines for all the patches, or? I
> didn't see any suggestions on how to approach this in
> https://docs.kernel.org/process/submitting-patches.html#select-the-recipi=
ents-for-your-patch

I am not an expert here but I think you generally want all patches to
go to the same group of people / lists. Maybe this isn't a hard and
fast rule but you lose context if you don't see the cover letter or
the change as a set. Also patchsets are picked up as a group, so the
whole thing needs to hit at least one list.

Probably somebody else could add some more context here.

> Sorry for messing up the line wrapping in the cover letter
> [...]

That was just an FYI, we can still read it :)


- Trevor

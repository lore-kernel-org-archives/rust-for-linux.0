Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F5B314A6F
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 19:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773342975; cv=pass; b=utsnOEHXxvi4DGXElOZXgI0wpQr/KPK4teiyFsDSTeqYZA8pxB6ZxzQXkY1t7hyY7OY//b/iFssR6Cr2Co3pWLSxYdhVU6gtWbdYgjZW/R1sfIXUNTxsX6NG+VsPEEs6TS7ut0BAX7Uw8WjI4220oSQOdxjLw2BqujXD++/Uvpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773342975; c=relaxed/simple;
	bh=vJ49uuB8mdFiJb29JSb7GIkPU0l6yrugoKSfMVQPGJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NytW4aqqDf+jdKgdtPyqKbXb8g58PW7hIYQ4FIZq4i/m7OSoHYFUcAwEwYrBfrfk6FME4uN61MeTeHwsxuj+wAhAfpIv0vAnMRmoa3wG5udl30wXOjEvhNr0zjQtkChrKT1ZiL7ZOS9ilydhogWT6AiznSVniu9+/n8rgWaBhv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FU7iwzPG; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FU7iwzPG"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2be084d8166so97070eec.2
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 12:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773342973; cv=none;
        d=google.com; s=arc-20240605;
        b=De7ocj9a/9sbkeIcyzdt6NScjU9TssEcjZA/Ko01DmZIX01LcgJhQX1EeZiyglWBvW
         Fqccyy3SnkQFe2iJCsoITHMVd9Tpkmle3FNLp2vMoodX3isRnC3YAvP4SHqcm6nBSBJ4
         xlyOBJc+6x6UrNa97wPRhS7TX5qtqsZbm9jtr199QFGPhkAQec1NEHYbfACfJ6n0/C7i
         ix4BBgyr5CyPGrlG+afWP3IQdHFWp5/6VkDQndL7xG8PvVY7cU792Q2e7Z4bE+AOBMpj
         iKd5YyTwgMKdN6GCcRLX1ntepO0j6aqwEH53kAv9geKLSQjcZEx7fv3mGEH2oRusBl5t
         dsJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2hzSysAOGotLHY/Gk0vtKsQ07bdjUjpPdIHGXWzs09g=;
        fh=qACWYH+XD9duSepsTKUBsslEdkuaRg05OiHjQIQd+RE=;
        b=lM63/DCHmp9Y9hRj4Tm+JCSc/sXTHN4Ff3ouA9s9jVt2AGb+XVX0WfNlvLFEYd7UrE
         D/4gHrA7ywQFV+xl0ABkey7L93EupuS9FUuF+aMpNGbflJvSrocblbgy4Ehqs63gKa5z
         fALVDCYZ9Cviun7lORR7ob9CZ6FSp46C5kn7NcOb9VBaVAmkNDxD0dToZXCNIf0aa2fa
         wdM05BsEdcIraENpS5kS95MA8c4nB2zsM+Bi+ED5O8izVVMDxvydOrQnXLASmZJa2HXu
         vvtq7R54aXmVnRgTeaY9/MprErxFzJzhxqIO+jhGWddjU1aD6cH2+BBcL8Ft7yN02nQf
         zFiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773342973; x=1773947773; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hzSysAOGotLHY/Gk0vtKsQ07bdjUjpPdIHGXWzs09g=;
        b=FU7iwzPGYPyu9TatfgBruyqZEiZA017XxvOIi6d/Ic9lbcdIrWNMsivMRYl62Bk03M
         CqUvkZaS2Zp9net2lvIhL7d53139F5L4AduvPYr+LpGvXNaZOCTawLGFXBhy511Gktij
         o7Ptt0oQs2AV6oMTmUdCLylZkO4xDO5x3zCCbTktgY6882k+CCukgV+KyFiDvvePKIwR
         5yh+tVDvMYWQqahp1wCAwYIzdbyaic3U6N2du/uBBkfBGvwaF9mva/+zIgnHHeUz31op
         Snd1sPjT39dbkrf+6ucXc8JY/WuO3Ix3bH7ebjq9Kww17IVAuu3LWoxAbGg0a9r1VQsD
         Lr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773342973; x=1773947773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2hzSysAOGotLHY/Gk0vtKsQ07bdjUjpPdIHGXWzs09g=;
        b=RWTY/0Xv+9qhXT9CqKm41lOc/Q9CIhQc4XlKaoJYIDrf0hiN4s4lAt4tGBRVoHyhEo
         tVg1dQgwXI5eRafE5+7dLQqbl2zwYldP7ON3L28n5hfiSEOwEfgZjPBqWH/s5RuI99bY
         PBDaYjLaXc7djOA2Szyx3OsNcLbaeVSKQTnw6Z+x0Av0uqnCrrXvW+bBlRebOBvyDb2P
         sh+RBky21HgrUxf83n0X2tRUDvseIiiXEZV53/ko5qVOCBsI27Tc1r8Ky2Q9Y0DD/Uvp
         bj1ifo6uEouE1XSS3brsokfUKHf6SYXYBF/oK3BZLIbQmGmg2xk/blv8w0sYfXpHFIt/
         9Grw==
X-Forwarded-Encrypted: i=1; AJvYcCXdo3obLYUdd1G0RGC4gOVGNx6Z3+geqVAlCzDodkQVaCY6G6tcn2r+aWDgw5hSS+l9cQgxY4ogE9ZtLMn4uw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb0pg6XV2dL7gvHEyflcnjN8iE5KvI9hlMEW1OxnJff6TDPI/R
	viLtxVAN2Wp5Qi1mIaIKgp2JWu9xoeTuTWblt8A8ugRVYu9q3O6mczCFkfl7I0LjRi9qVZEav0W
	XodIKd37U+ONDVn1BzXUI49GlXcBq4sQ=
X-Gm-Gg: ATEYQzwRs3EV1t+97RtfcQc7fxdt590zZOvxZo6g2yyAZDbN3rOkzGC6oACTrrEmN14
	uN8J5IDKlChmXxscnjdnMn5sRXnPIwgMIyAbDjRvTJqtO96wX0ZfaA3PMDdWlZIh8UX2xtxUmCA
	cw3fnTgAH8f0cTs6JuurKyKCst9DJwBa8+X9sdbvgoA+EQMoXDxOYeUoT8PlyIhLSGVVS+YpP6W
	TcX9gXvU8l7siCQarxjDir7+o9TlfbcuFziXTc/uexgBj8RLM3PkFY4YaE5GERMd1z80XdEInS/
	BfkMCCpvQteEcgR0M/f24ghG0lugrWze71HeihxGOyeniXY3YCBIZFlS0sDcYMVLfIER8xHzmhn
	sKMWKLIRLy+JyI1qDesFjq4s=
X-Received: by 2002:a05:7300:fd03:b0:2be:171c:2177 with SMTP id
 5a478bee46e88-2bea5744a60mr186533eec.7.1773342973060; Thu, 12 Mar 2026
 12:16:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306203648.1136554-1-joelagnelf@nvidia.com> <20260306203648.1136554-2-joelagnelf@nvidia.com>
In-Reply-To: <20260306203648.1136554-2-joelagnelf@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Mar 2026 20:16:00 +0100
X-Gm-Features: AaiRm537cVQtFBzSwOEaMgXdjzYeE0uMIzdX3f2cfwXX8kFS15LK67mGvYzfQo0
Message-ID: <CANiq72m2Eo1UAuwMC0LhiD4+yqKixRm=+oHtEnpwY-VbNdR+fw@mail.gmail.com>
Subject: Re: [PATCH v12 1/1] rust: interop: Add list module for C linked list interface
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>, 
	Nikola Djukic <ndjukic@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
	Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Helge Deller <deller@gmx.de>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Balbir Singh <balbirs@nvidia.com>, alexeyi@nvidia.com, 
	Eliot Courtney <ecourtney@nvidia.com>, dri-devel@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 6, 2026 at 9:37=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.co=
m> wrote:
>
> Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

> +//! # // SAFETY: head and all the items are test objects allocated in th=
is scope.

`head`

> +//! // Rust wrapper for the C struct.

Empty newline comment between these:

  //! //

Actually, should this be `//! ///`?

> +//! // The list item struct in this example is defined in C code as:
> +//! //   struct SampleItemC {
> +//! //       int value;
> +//! //       struct list_head link;
> +//! //   };
> +//! //

Let's try to use the usual style, i.e. no empty newline at the end of
docs for an item.

And the example should be in a proper code block with a C tag, so all
together something like:

    //! /// Rust wrapper for the C struct.
    //! ///
    //! /// The list item struct in this example is defined in C code as:
    //! ///
    //! /// ```c
    //! /// struct SampleItemC {
    //! ///     int value;
    //! ///     struct list_head link;
    //! /// };
    //! /// ```

> +//!         // SAFETY: [`Item`] has same layout as [`SampleItemC`].

No need for intra-doc links in comments (for now at least).

> +//! // Create typed [`CList`] from sentinel head.

Empty newline comment.

> +//! // SAFETY: head is valid and initialized, items are `SampleItemC` wi=
th

`head`

However, this is giving me a Clippy issue (please see the other email).

> +///   `next`/`prev` pointers are valid and non-NULL.

We started using `NULL` recently as a convention for the null pointer.

> +        // - [`CListHead`] has same layout as `list_head`.

Intra-doc link not needed.

> +        // - `ptr` is valid and unmodified for 'a per caller guarantees.

`'a`

> +        // SAFETY: self.as_raw() is valid per type invariants.

`self.as_raw()`

> +/// perform conversion of returned [`CListHead`] to an item (using `cont=
ainer_of` macro or similar).

Intra-doc link to `container_of`?

> +        // - [`CList`] has same layout as [`CListHead`] due to repr(tran=
sparent).

Intra-doc link not needed.

> +        // Convert to item using OFFSET.

`OFFSET`

Newline comment after this one.

> +/// Create a C doubly-circular linked list interface `CList` from a raw =
`list_head` pointer.

[`CList`]

> +///   pointing to a list that is not concurrently modified for the lifet=
ime of the `CList`.

[`CList`]

> +/// Refer to the examples in this module's documentation.

Perhaps we could have an intra-doc link here to the module.

> +        // Compile-time check that field path is a list_head.

`list_head`

Cheers,
Miguel

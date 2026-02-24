Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DE6223DE7;
	Tue, 24 Feb 2026 15:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771947803; cv=none; b=QiePTCL8Dua3Q67MzFMCEFPWRipxMo99IO6SlG3Jj9QnAv571mgj+hAJLy1KvCacogT1oxms489SlXOtE3CN35e1h7ronDe9m4999n1CVJB/BNJggmO+xVnpXskVQGGEyHoND0ikZJZU800spEjYcllqRqfYJk+qXgtb9M/XLrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771947803; c=relaxed/simple;
	bh=iRZC6waXaSyGTg1hlX1XWHKiFbNvR501T87XQTbp4n8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LxLmNxWQ6IRl/9+CKcc31P9ImMmcmgyklue4brPVib61rNrUPosG/Dh1soHDwpstrV/mbSjYWgs7QFexuKs0eAGyvONw0Wm5Z/YeOoQW2TGRXPZzk8bD8m54zT0EZyml15Bm+cPfLEc2zXdPGhLb8TLUnVV9Ss3lOk4eiphJhLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DUA/AIrg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DUA/AIrg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A26DC116D0;
	Tue, 24 Feb 2026 15:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771947802;
	bh=iRZC6waXaSyGTg1hlX1XWHKiFbNvR501T87XQTbp4n8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DUA/AIrgxR7k3FnJJyTi+5evvX6Reg7BYI9fTQkvua1sozXzRqKFFLgpOZlxxE9mm
	 2nwS2J79qmsDcq0Jhb8SFzgIrFJLZ7JAzTUBVLzdoKh9r49gNsNsZAzIWThDiUyNnp
	 LkmYsWTusEIyM4rPVD6rMEXxfhB75OLqaZUlpdjGCHi6v1WR5Vohm2ArLxKVWKFJ9/
	 rr7nO6FJFWla+Gb/dNXMt/geN8+B/2RSjwsUU4x1ajxgfXrE43J8dpnuj17yzzlyTT
	 on4AhSwayhjlmXEfCdfiX4Lt+OfldYwdBFbdeZ0sPdMgLcD8dLtXUQEg+noodaiwcQ
	 9JSAZaOENEfnw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, Christoph
 Lameter <cl@gentwo.org>, David
 Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>,
 Harry Yoo <harry.yoo@oracle.com>, Daniel
 Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 04/12] rust: xarray: add `XArrayState`
In-Reply-To: <CAJ-ks9mtwo6eAvmT6qbL+Mg_=A+-zdtiBw6BtsfO2eZ8HbkXWg@mail.gmail.com>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-4-f777c65b8ae2@kernel.org>
 <CAJ-ks9=hWB2eFcEj1obfsoLvK15=YR9y=hifxVyeB=mJOz+gXQ@mail.gmail.com>
 <87ms0y1akt.fsf@t14s.mail-host-address-is-not-set>
 <4V-olEAuXuPUO6t34rF2sn2KT3zYNdPHxGclD7-fJjKJNoXQPZNDJfc_ukQ3VyGVnbbdbCasUteYnH3U97s2zQ==@protonmail.internalid>
 <CAJ-ks9mtwo6eAvmT6qbL+Mg_=A+-zdtiBw6BtsfO2eZ8HbkXWg@mail.gmail.com>
Date: Tue, 24 Feb 2026 16:43:08 +0100
Message-ID: <87jyw2171v.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Tamir Duberstein" <tamird@gmail.com> writes:

> On Tue, Feb 24, 2026 at 9:27=E2=80=AFAM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> Tamir Duberstein <tamird@gmail.com> writes:
>>
>> > On Mon, Feb 9, 2026 at 6:39=E2=80=AFAM Andreas Hindborg <a.hindborg@ke=
rnel.org> wrote:
>> >>
>> >> Add `XArrayState` as internal state for XArray iteration and entry
>> >> operations. This struct wraps the C `xa_state` structure and holds a
>> >> reference to a `Guard` to ensure exclusive access to the XArray for t=
he
>> >> lifetime of the state object.
>> >>
>> >> The `XAS_RESTART` constant is also exposed through the bindings helper
>> >> to properly initialize the `xa_node` field.
>> >>
>> >> The struct and its constructor are marked with `#[expect(dead_code)]`=
 as
>> >> there are no users yet. We will remove this annotation in a later pat=
ch.
>> >>
>> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> >> ---
>> >>  rust/bindings/bindings_helper.h |  1 +
>> >>  rust/kernel/xarray.rs           | 41 +++++++++++++++++++++++++++++++=
+++++++++-
>> >>  2 files changed, 41 insertions(+), 1 deletion(-)
>> >>
>> >> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings=
_helper.h
>> >> index a067038b4b422..58605c32e8102 100644
>> >> --- a/rust/bindings/bindings_helper.h
>> >> +++ b/rust/bindings/bindings_helper.h
>> >> @@ -117,6 +117,7 @@ const xa_mark_t RUST_CONST_HELPER_XA_PRESENT =3D =
XA_PRESENT;
>> >>
>> >>  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC =3D XA_FLAGS_ALLOC;
>> >>  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 =3D XA_FLAGS_ALLOC1;
>> >> +const size_t RUST_CONST_HELPER_XAS_RESTART =3D (size_t)XAS_RESTART;
>> >
>> > Please add a comment to explain the cast.
>>
>> How is this:
>>
>> // `XAS_RESTART` is defined with type `struct xa_node *`. `bindgen`
>> // cannot generate pointer typed constants, so we cast to `size_t`.
>
> Can we include a citation or explain why bindgen can't generate
> pointer typed constants?

If you have one, I can add it. I don't know why this is the case. My
guess is that it's just not implemented yet.

Best regards,
Andreas Hindborg


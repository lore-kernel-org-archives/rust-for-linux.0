Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522CA427F93;
	Thu, 27 Aug 2026 09:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787824200; cv=none; b=avJPL3Yo2z7FCaYmXEF+wsuDjxdjRE62tZ2S68jdLDeduTvXjlE7INtRyp4pny/YoIxTYA5MBHg36EznOp5ITnV69CnoMYlYmT2dZonWvVyOzEPOmU+cumCVYEGhKIKCHU0H2vI2bZyWzQfvCxW/nqw12gN7G/XQCJ/hbNk6Shc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787824200; c=relaxed/simple;
	bh=FIFXlfGpUOSEaHF6eRskNcNI4xo67DFT69sg2vSFFgM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nXaL/sYMocCjYNMjkv6K0OPxBPm4iA79pmctsZG54kT+vOiOl4wu1eq/JPI5w0NWPTIiIymeYtKYQxzbfmHDvbZPeRJkZMR1C0Hk2/eowtOpBfwh/6uw3xpitMW0NHpU6YRsoidn2+yp9AfxYNfatyxvZGnRbNTWzp4sz+iPYbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QnxwIlmE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QnxwIlmE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC331F000E9;
	Thu, 27 Aug 2026 09:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787824197;
	bh=okdYwXge/FY7cpxLUHBxfPZDHCIFHA5JFploqVuKJS8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=QnxwIlmEKraWjzXLrsVBDdJtv0fJLC8qPJ56yWA4Cfu461hUx/ZuY2rlNWRlnH6Dc
	 FjbrhPIZ2b0AhNzzt2gK+y+q2bXm7DGnQ2cTFzTBM8O+Vfe7ua0oCTUUSTWCMS5aI9
	 GJjBhL+5asBl8AtTQ+ScdvFgT9AxHW55eTlILTwlOKCzPyTKpluXwKyIs9a0pYCNN/
	 +jOipGjh7IkYq2aqbv+g0L7iONahfOeaHV/Pf/Vb+zZ7sp2HeI3/P8CTQfnI1/1As/
	 U7HFVJcA4AG2c/1YuSS/TZZgcQc2o5wsm0Z04bEbzImw+LyhKJjXMEZqdkEdIR0yDQ
	 CzfktT7NAhAzw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter
 <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, Tamir Duberstein <tamird@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Harry
 Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>, Daniel Gomez
 <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 06/11] rust: xarray: add `find_next` and `find_next_mut`
In-Reply-To: <BEA4B094-7587-45C8-801C-A6F49E574EA6@collabora.com>
References: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
 <20260604-xarray-entry-send-v4-6-965f6028790e@kernel.org>
 <BEA4B094-7587-45C8-801C-A6F49E574EA6@collabora.com>
Date: Thu, 27 Aug 2026 11:49:37 +0200
Message-ID: <87mru728r2.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Daniel Almeida <daniel.almeida@collabora.com> writes:

> Hi Andreas,
>
> I wonder if we can't hoist most of these calls accessing self.state.state=
 to
> the XArrayState directly? For example, I see this in a couple of places:
>
> +            bindings::xas_result(
> +                &mut self.state.state,
> +                bindings::xa_zero_to_null(bindings::xas_store(
> +                    &mut self.state.state,
> +                    core::ptr::null_mut(),
> +                )),
> +            )
>
>
> How about XArrayState::replace(new: *mut c_void) -> *mut c_void?
>
> Also:
>
> +                state.state.xa_node =3D bindings::XAS_RESTART as *mut bi=
ndings::xa_node;
> +                state.state.xa_index =3D 0;
>
> Could be e.g.: "restart_at(index)=E2=80=9D.
>
>
> WDYT?

I think that is a good suggestion, I will do that.

Best regards,
Andreas Hindborg



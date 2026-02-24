Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4220739B48D;
	Tue, 24 Feb 2026 14:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771943230; cv=none; b=Q1F5RbrfkpOCBu4MtPkbmG/nh+kmmoaSpTsrHVEWn8U58k2IX9Y0RoEgHlEz0fA5r7eRdkiX8+j0J3OPHAjDh6hJAhq61h9xfoZHfyRFzx+UAFIxki33ME7+gQi5KtMOZARtD121cVGEA47kgqJiF+7DAYKBn8ZYqhDsy83njn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771943230; c=relaxed/simple;
	bh=uafOB0Tp7QVjAwnRblJUmMVdq5doGs3C2G3o+M2e8F0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nKkCjn+H+V6uylhY2GILkvQuE9D69OSpxiqouvSOAp149ARVEnSDrwoIyEQZpah+vKceGftPJODGEeT9zRyRsICVWWdNIuVj6iP79+c0uYZxiPR50ZR16j3fXqUHYLUbj2SHYqG1dphR5BQtRYXmL6Jl/TZqgULCsVmEFZEM9yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CcKZczLD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CcKZczLD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E61CC116D0;
	Tue, 24 Feb 2026 14:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771943229;
	bh=uafOB0Tp7QVjAwnRblJUmMVdq5doGs3C2G3o+M2e8F0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CcKZczLDoduGlH3ZRkDfEPtT31kBJlUYdWrl2UpzW37JXgV1CcAMtHJcuEDy3qMXv
	 ALjj6/ZPPD8QCHNs6kb6PqkAL5I6rmrDYKT1jJuOrs4x89+dsk48g1QB3tTI1yvVFz
	 ckO4uIg6WpwTM4S/mps0chHqVO7faGID79bVCSIL6P0RpAxIZhzp/bZk5jApG3GWtL
	 kxb6ItxYgdt2d6U10qMCMNj5YKuhQXZDzm5BCWGiAWUHKmUfbu42hFv5MZkjEVpuN5
	 MQ8iOH1FRI2aOzPzCvJD37n4Drwy8nAaQltLliAsCWsxy2jCdoruSsdWXD0dZXVfKb
	 Mu8zWkPICfmcg==
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
 Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman
 Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>,
 Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 04/12] rust: xarray: add `XArrayState`
In-Reply-To: <CAJ-ks9=hWB2eFcEj1obfsoLvK15=YR9y=hifxVyeB=mJOz+gXQ@mail.gmail.com>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-4-f777c65b8ae2@kernel.org>
 <CAJ-ks9=hWB2eFcEj1obfsoLvK15=YR9y=hifxVyeB=mJOz+gXQ@mail.gmail.com>
Date: Tue, 24 Feb 2026 15:26:58 +0100
Message-ID: <87ms0y1akt.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Tamir Duberstein <tamird@gmail.com> writes:

> On Mon, Feb 9, 2026 at 6:39=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> Add `XArrayState` as internal state for XArray iteration and entry
>> operations. This struct wraps the C `xa_state` structure and holds a
>> reference to a `Guard` to ensure exclusive access to the XArray for the
>> lifetime of the state object.
>>
>> The `XAS_RESTART` constant is also exposed through the bindings helper
>> to properly initialize the `xa_node` field.
>>
>> The struct and its constructor are marked with `#[expect(dead_code)]` as
>> there are no users yet. We will remove this annotation in a later patch.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  rust/bindings/bindings_helper.h |  1 +
>>  rust/kernel/xarray.rs           | 41 ++++++++++++++++++++++++++++++++++=
++++++-
>>  2 files changed, 41 insertions(+), 1 deletion(-)
>>
>> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_he=
lper.h
>> index a067038b4b422..58605c32e8102 100644
>> --- a/rust/bindings/bindings_helper.h
>> +++ b/rust/bindings/bindings_helper.h
>> @@ -117,6 +117,7 @@ const xa_mark_t RUST_CONST_HELPER_XA_PRESENT =3D XA_=
PRESENT;
>>
>>  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC =3D XA_FLAGS_ALLOC;
>>  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 =3D XA_FLAGS_ALLOC1;
>> +const size_t RUST_CONST_HELPER_XAS_RESTART =3D (size_t)XAS_RESTART;
>
> Please add a comment to explain the cast.

How is this:

// `XAS_RESTART` is defined with type `struct xa_node *`. `bindgen`
// cannot generate pointer typed constants, so we cast to `size_t`.


Best regards,
Andreas Hindborg



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD306390CA3;
	Wed, 30 Sep 2026 07:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754417; cv=none; b=VA7LG4OoCydFc1t3XBOwiL5NmfuqNeB+xf53SGxNG2mqNi57kjFNlh7eiRsgYCserlRyS1PXEWxNTjgaLAjEmuu0i5WFIb5VuFtjYfk30+r+aPTFfhidqWky94qmrWqW+xqr2dPsC4tieRK1bxkY3qJT9G+7o0rti0jqt3pxlnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754417; c=relaxed/simple;
	bh=0lH99gzpaRXdmgjceqxaEBvoxSO35QiinBgQweVB2kY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=h1j0TdlW52dUC0we7Z7QzRuqsNnWlaont2vRD/O0es1oqmN/MPmRvTrpbx+jme/Bi0Aj+0DT4gmpap6hS6PPh8WtyAwv14/IlwE4h30Uxil+lhEf5/UsZCQR8U7gsD2SMwC9fV0hWyy3ZXE7P0T/9uYYF6daCFa+PfNiqaz05XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mceNqOnw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mceNqOnw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 249971F0089A;
	Wed, 30 Sep 2026 07:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790754416;
	bh=0lH99gzpaRXdmgjceqxaEBvoxSO35QiinBgQweVB2kY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=mceNqOnwUluJsWaXZcAd9BlDZpjDXO/tEUw9Nd9TGeKYlAVsyWGewoeuTd/ZevqXm
	 NFyO+8iPXgY/kQWz4OOyTSM3++4qknnFECIsMhXNqh/urnfcuWHvLicg108Mn1La23
	 GHD7VsDahi2z6DH0WMp+yBofnscuYYZIF7mxdQD0Z17yC9O77BfBgVGSX0U50fVjVm
	 x9J+hBCyKDtlB6Y14DRhtgqETILoVUd/G9mx3SFTeWR2+GIJu5GuwNUkYp7OZL7ugN
	 y9d/19JYBHepyeKDs5jgnRFaQyUZYHzlOm2CVUeatseBzbs8s34WMm5zUz2okSAmoE
	 oeJ1lS9LWg6Yw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel
 Almeida <daniel.almeida@collabora.com>, Tamir Duberstein
 <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Onur
 =?utf-8?Q?=C3=96zkan?=
 <work@onurozkan.dev>, Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka
 <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Uladzislau
 Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: add a wrapper for the `num_possible_cpus`
 C function
In-Reply-To: <CANiq72k-_LX5GVSKWQQ5EJV25GDfXOhOebv3TLqdA63tQHNd-Q@mail.gmail.com>
References: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org>
 <20260929-cpu-helpers-v3-1-e968ce5ee613@kernel.org>
 <CANiq72k-_LX5GVSKWQQ5EJV25GDfXOhOebv3TLqdA63tQHNd-Q@mail.gmail.com>
Date: Wed, 30 Sep 2026 09:46:41 +0200
Message-ID: <87cxtvb2qm.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> On Tue, Sep 29, 2026 at 7:58=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> This function returns the maximum number of CPUs that can be online.
>>
>> The wrapper is needed by the Rust null block driver.
>>
>> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>> Reviewed-by: Gary Guo <gary@garyguo.net>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> I can pick this one -- it could have been an independent patch anyway, no?

Yes, this one is independent. At v1 I had 2 patches adding helpers, that
was the only thing relating them. I thought it was better to lump them,
but maybe not?

Best regards,
Andreas Hindborg




Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C731A13B7A3
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Jan 2025 07:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737616302; cv=none; b=gAWmz32RyX78/OOC+ILj3OXv74SmXhU3Yu7DWEBP4x4928aTlyDT6axaZYP5fqyXM01WhO/l7JSZ4Epxyn020HGtS7vcgyaEsXeopZD5/ft+baSw9mzNefmMwS7N85nfghyVXdue5b5oYRN3zb9ybn4guIQsMFtXlHaM05e+bRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737616302; c=relaxed/simple;
	bh=9Y0HAvW6gvR4hWnQ7cqnSRcM5eVWdf7viV3ox2Yc7F0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uG5WckfMa5NkrDIoUZrfVOlHSAlch9FsFpPV+dWXiGgWtFDM3XFCys4i32bQ+rlEgbSk5Lhsly9N1dIxPwZrAK3aY8NoC+hbut+GV3qaNEMktgAlzD2WvuNJm+AYOPh/33/pbDgScyrJfJ58gmibMAUwMY1nJC8n5t+1txR5/r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=fMpZ7y1x; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="fMpZ7y1x"
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1737616288; bh=9Y0HAvW6gvR4hWnQ7cqnSRcM5eVWdf7viV3ox2Yc7F0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fMpZ7y1xNbUmKyB2hRyTUGJoDn88HG/Q9TU675LlL/1ybxYFYpciJhblVkn1NhFGw
	 AI/Q+YFCctufLL7OIVwlbdzAwGmCyn8it9wA+XWl9mHkJ0kPCgSTiUy4MHEvTBOKDA
	 8hcrLQDkTEUO4azzQu6lpfIfkFdluwSCGsHJyHwY=
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, daniel@sedlak.dev,
 aliceryhl@google.com
Subject: Re: [PATCH v4] rust: error: Extend the Result documentation
Date: Thu, 23 Jan 2025 08:10:34 +0100
Message-ID: <D61931EB-C970-4B47-9C2E-FDC353A1BF55@kloenk.dev>
In-Reply-To: <26d57f25-d2ff-4967-abf3-3d329c04d3ef@de.bosch.com>
References: <20250122054719.595878-1-dirk.behme@de.bosch.com>
 <DFB88CA7-B9B9-4007-BFFB-02E624BA7ED3@kloenk.dev>
 <26d57f25-d2ff-4967-abf3-3d329c04d3ef@de.bosch.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On 23 Jan 2025, at 6:49, Dirk Behme wrote:

> Hi Fiona,
>
> On 22/01/2025 10:57, Fiona Behrens wrote:
>> On 22 Jan 2025, at 6:47, Dirk Behme wrote:
>>> +/// ```
>>> +///
>>> +/// Instead of these verbose [`match`]/[`if let`] the [`?`]-operator=
 can
>>> +/// be used to handle the [`Result`]. Using the [`?`]-operator is of=
ten
>>> +/// the best choice to handle [`Result`] in a non-verbose way as don=
e in
>>> +/// [samples/rust/rust_minimal.rs]:
>>
>> All examples above feature a pr_err and then return the error. Then th=
e `?`-operator is just called less verbose.
>> Maybe it makes sense to also state that it then does not print anythin=
g and possible also show that it could be
>> logged at this place with `inspect_err`.
>> Though I remember that usage of inspect_err got discussed at kangrejos=
 (rfl-conference) but don=E2=80=99t fully remember the outcome,
>> think it was something like use it sparingly.
> Yes, we talked about that. If I remember correctly the conclusion was
> somehow that the caller is responsible to report correctly about
> possible errors he gets back. Like in C. And yes, I think the
> samples/rust/rust_minimal.rs used here is exactly an example where this=

> is *not* the case. This is what I called "silent" errors.
>
> The idea of this patch is "don't use unwrap/expect as it might panic".
> And yes, we need some explanation for using the `?`-operator correctly.=

> Esp. to avoid these "silent" errors.
>
> But would it be ok for you to do this in two steps? I.e. having this "n=
o
> unwrap/expect" patch. And then in a second step a "use `?` correctly"
> explanation?

My idea was that having a comment that states that this will not print so=
mething avoids confusion, as all examples above to print a message and th=
en this is just a alternative and nothing get=E2=80=99s said about them b=
eing =E2=80=9Csilent=E2=80=9D.
I am fine doing that later, just shouldn=E2=80=99t forget it.

In case you want to first merge this and then new patch for the silent ex=
planation:

Reviewed-by: Fiona Behrens <me@kloenk.dev>

Thanks,
Fiona

>
> Best regards,
>
> Dirk

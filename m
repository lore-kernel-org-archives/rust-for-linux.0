Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6863314D2;
	Tue, 10 Mar 2026 10:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773138908; cv=none; b=AnvBOAvzoJBs/1PiDp13dpeVP4pSn+87jKJZx4Grqwpd4Oz61SwiznQcjK6Y8itHrl0Sl/WnTU/9XJgvNiHK7ZNi6HtcSpeIbrMG1Y54XC/70GqyAcPwOT5w+G2lRZZwqXhvvocvmQQI390aihel2VccZiao1wYnf0rcx2l5wfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773138908; c=relaxed/simple;
	bh=o3jFtbDjVq5zxQWyC4adOecn3nFUZ4TF7ZRoY2jTlWY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=bMBr+KW4XXlSwxlCJw1UwYBx39A2MAvmka9Vp5SM/mfuM9r9gq4PPWkf4OinbsxRU67M6rZ1Qm1KgOAuVddrskKzkQz1oM2F4zfF5Nfj84sXTQPJzml/rqriGJuDV3nyj74Yy/XeSIuirISW51pfdeJOFh4wjcWMaE/1P8E5rW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m5uljI2K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5uljI2K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C501C19423;
	Tue, 10 Mar 2026 10:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773138907;
	bh=o3jFtbDjVq5zxQWyC4adOecn3nFUZ4TF7ZRoY2jTlWY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=m5uljI2Ka7GzfelDMbi9R1Wj/orOidAngK08ZDDKKF0nHYm5Ickl+hWJqTzZ/c5Ve
	 t6Vl4F15Z1v4nPQaGFjZ8o/pNTOtJpq/OCYMwSBG/KPjSAlGhi0BFgOMrsiUh91VQ8
	 qfwGfyDOaFYquyHQtA7rdsOMyU59Uhhf0/Ce+rEGljMLNT/9jCGZPPSFF4s+kZ6liw
	 s9KcXrz6aKXdZoSUF4kdvn+X/Z238a55uxUupNKgSlaxAHM6KsNeHO6f+8G3ZnIoqH
	 1IqxbWE1wOf/enu7gFSv81T65tiqLyIM2LGHJyFTHVLTkcV8ijY1uNt7A/McfNNVSu
	 SWvgXjZNAsLAw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 11:35:04 +0100
Message-Id: <DGZ1A7CGUNF4.3035UQ0ZGPHBA@kernel.org>
Subject: Re: [PATCH 3/9] gpu: nova-core: gsp: expose GSP-RM internal client
 and subdevice handles
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Simona Vetter" <simona@ffwll.ch>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <288fc58b-657c-4e8c-b6bc-d07afe14bb97@nvidia.com>
 <eaba411f-d882-4175-ac43-a9217fbb915b@nvidia.com>
 <DGYR3ZICOYFB.2ZHQ2CTUO2UIP@nvidia.com>
 <DGYSXKA569RE.2KZUJR434RNJM@nvidia.com>
In-Reply-To: <DGYSXKA569RE.2KZUJR434RNJM@nvidia.com>

On Tue Mar 10, 2026 at 5:02 AM CET, Eliot Courtney wrote:
> On Tue Mar 10, 2026 at 11:36 AM JST, Alexandre Courbot wrote:
>> On Tue Mar 10, 2026 at 11:17 AM JST, Joel Fernandes wrote:
>>>> On Mar 9, 2026, at 8:06=E2=80=AFPM, John Hubbard <jhubbard@nvidia.com>=
 wrote:
>>>> On 3/9/26 4:41 PM, Joel Fernandes wrote:
>>>>>>> On Mar 9, 2026, at 5:22=E2=80=AFPM, Joel Fernandes <joelagnelf@nvid=
ia.com> wrote:
>>>>>> On Fri, Feb 27, 2026 at 09:32:08PM +0900, Eliot Courtney wrote:
>>>>>>> +    h_client: u32,
>>>>>>> +    h_subdevice: u32,
>>>>>>=20
>>>>>> I would rather have more descriptive names please. 'client_handle',
>>>>=20
>>>> Maybe it's better to mirror the Open RM names, which are ancient and
>>>> well known in those circles. Changing them at this point is probably
>>>> going to result in a slightly worse situation, because there are
>>>> probably millions of lines of code out there that use the existing
>>>> nomenclature.
>>>
>>> I have to disagree a bit here. Saying h_ in code is a bit meaningless:
>>> there is no mention of the word "handle" anywhere near these fields.
>>> h_ could mean "higher", "hardware", or any number of things. The only
>>> reason I know it means "handle" is because of expertise with Nvidia
>>> drivers. The `_handle` suffix is self-documenting; `h_` is not.
>>
>> I tend to agree with Joel that we should try to avoid NVisms when they
>> get in the way of clarity - that's what we did so far actually. We can
>> always mention the RM name of fields in the doccomments.
>>
>> The only exception being generated bindings, but they reside in their
>> own module and are opaque to the rest of the driver.
>
> Thanks everyone for your comments so far. I don't mind about the naming,
> I can see both arguments. But we have two votes for different names for
> h_client/h_subdevice/etc so far, so I'll go with that for now. If anyone
> has any other suggested names keen to hear.

Please don't mirror names from other drivers (regardless whether it is Open=
 RM,
nouveau, etc.) just to be consistent with the naming of other drivers. If t=
he
name is good, great, otherwise please pick what makes the most sense.

In this case h_client and h_subdevice aren't great names at all. I don't wa=
nt to
establish a pattern where we prefix handles with 'h' to distinguish them fr=
om
other values.

There is no reason to have such a convention if we can just represent a
handle through a proper type (which has other advantages as well), i.e. we =
don't
need to resolve any ambiguity due to a primitive type.

For instance, we could have a gsp::Handle type and then this could just bec=
ome:

	client: gsp::Handle,
	subdev: gsp::Handle,

If we want type safety to a point where we can't even confuse different typ=
es of
handles, we could give them a type state, so we don't have to re-implement =
the
same thing multiple times, e.g.


	client: gsp::Handle<Client>,
	subdev: gsp::Handle<Subdev>,

I.e. when a method expects a client handle, nothing else can be passed it.

- Danilo

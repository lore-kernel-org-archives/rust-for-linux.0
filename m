Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF28A3AFD15;
	Wed, 30 Sep 2026 11:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768059; cv=none; b=jcbK0sn9P2/7gpU4UXEl49lXqLdyHWO7cPzV7ynsZmrH+hifnEMWP7FITBVNRvnZJZDF5TIj0yV4VHX3ExGpAVUl1pWv995DN/tApRBuVINOQfFQ0BmOnUp08jWjEFKjSR1f6pEGpBpfvMpjGhFw6s/rSZz1tYKIjj/R65IC3QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768059; c=relaxed/simple;
	bh=tTyY761eDk/yR2i3+oaxaCJ9QFkxChWI5Be3HhwwfiA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cIMVVf29zj0rOoFMrnjzgxbXHqWrYvmyUIv1aWcevFeimKJhEgZctgJwmO3ZyNBTI+2VMQTSudliXWUGP2V+YIv6l9CjYf/OQJOoDxmZiGvn9bqpiVE6pksyFl3SoUF69aeoJmM9tq6TTpNtgtRbNBh4QDyt5OjeNpna4HBXtq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3wnVsXM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3wnVsXM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A5531F000FF;
	Wed, 30 Sep 2026 11:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790768058;
	bh=tTyY761eDk/yR2i3+oaxaCJ9QFkxChWI5Be3HhwwfiA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=I3wnVsXMxuPEy9IPshs2lHaNtNcKRSfSERvsxJMgp+Q4iX764ntExoe5pKRRQLo4S
	 Xnsyh6OePy+2+8DMCLSAxtK3vnPKyByXIjGEJlggmFISm7uWdpRIUSU1GLAB12VXTi
	 mXrc2veVqcsjgU1BCPrSg3yVSNOJ+sHJp40v2MEnJI9IVnJbLWU3lat6ooQLikHRw7
	 hP/z/umfJeX8fslZvpXyy3RiH7QtHIKqFbECo1GxwmPb7eeXq876rNHGRL2+lYHVp/
	 ux9/GUq7xNjOABkONZjitpzTT5vA8GkrjrvPfaoGd0/pI43oZ06sb344bNDPm+KEjS
	 qGBv2o23gpPCw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Peter Zijlstra
 <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel
 Almeida <daniel.almeida@collabora.com>, Tamir Duberstein
 <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Onur
 =?utf-8?Q?=C3=96zkan?=
 <work@onurozkan.dev>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka
 <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Uladzislau
 Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: add a wrapper for the `num_possible_cpus`
 C function
In-Reply-To: <CANiq72kZh4a39hcy0g9sqEmzx3m+dcPRW=omOB2r5DhpRq3BXw@mail.gmail.com>
References: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org>
 <20260929-cpu-helpers-v3-1-e968ce5ee613@kernel.org>
 <CANiq72k-_LX5GVSKWQQ5EJV25GDfXOhOebv3TLqdA63tQHNd-Q@mail.gmail.com>
 <87cxtvb2qm.fsf@t14s.mail-host-address-is-not-set>
 <CANiq72kZh4a39hcy0g9sqEmzx3m+dcPRW=omOB2r5DhpRq3BXw@mail.gmail.com>
Date: Wed, 30 Sep 2026 13:34:01 +0200
Message-ID: <87a4ozas7q.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> On Wed, Sep 30, 2026 at 9:46=E2=80=AFAM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> Yes, this one is independent. At v1 I had 2 patches adding helpers, that
>> was the only thing relating them. I thought it was better to lump them,
>> but maybe not?
>
> Thanks for clarifying!
>
> By the way, do you think the new header is worth it instead of using
> the existing `cpu.c` one? If we do that, then we should probably add
> it under their `MAINTAINERS` file.

The helpers should go in cpu.c, that makes sense. Not sure why I put in
a separate file, maybe cpu.c was not present when I sent v1.

Do you mind moving the code when applying or do you want a new version?

Best regards,
Andreas Hindborg



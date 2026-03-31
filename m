Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183693033F8;
	Tue, 31 Mar 2026 11:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774958042; cv=none; b=oKVyABBE/4hxDsCQnS9wAizTnfm85wUOpKbtpQ28SMjRuk3CcdPkhb5v3qy2imqqDyv+XqhnWYGwy0HMlAP3sFXqDECwo5sr57N3kJxdDlkkpsXpNmhZCZwnzJ9D7VJ7oLpSTlWZdyFKdMtNEJKsjwMv5eJsvN22vsmw4PklaEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774958042; c=relaxed/simple;
	bh=D6SagFrrwr2q00crJRh77pB+htNNJ+5t2gI6uqOg7uU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b4R/1NPNBUNd515YzS0J1pSZ4RWeoERRt+wGHKyX5VBDTCzNOw2zolpf/TkNSaOqD5toYDiYGnvh9QdKFVKfoeMo+keQPwvgvMO2T/7/CSGEqGb1c28zYnObQ0DYTE2GpYGLf9ZPu0gtGu6MNbi19RnZh3UfdVsXibdlA3+uFPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XbzUVdOl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XbzUVdOl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FA6EC19423;
	Tue, 31 Mar 2026 11:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774958041;
	bh=D6SagFrrwr2q00crJRh77pB+htNNJ+5t2gI6uqOg7uU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XbzUVdOlOqD6Z+idR4mJjeWie1aLE6QMM9e7b6sRAI2AoDdHVyPcc6KQ28nZqUOgu
	 5WSY1DvPN+q49jUgdNUFgz9zz6Ac2HaC0sOOvscpzvTG+Uy9JZNSzR2eFkTfQhfOYI
	 Bmlt8+kfqm9GiPD7WM0qbW7HgxSrPS2LqMSmuZnpUpLUBOZhyYaUkul/FaCqNBaa8O
	 QvyCAsp/ph/YSPWh+MAQXawjhxRlcE8enL/s+j+aVZ8Jood7Mj4EK6Lz3bHn7K2vC6
	 qQ2W1nwIp7RgtC8aUwr3Fl23DJWwrBwQOLW9CGleg0rWDqmloPW0gqgzOOjczIoSbO
	 NMGLuYysJUq8g==
Message-ID: <db891b62-0c23-4975-a730-faa0d6a85257@kernel.org>
Date: Tue, 31 Mar 2026 13:53:55 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 16/31] rust: ptr: add const_align_up()
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <20260326013902.588242-17-jhubbard@nvidia.com>
 <DHGLXL0DVBAJ.2M58T9RSK5OO7@nvidia.com>
 <dc9aea56-d95c-4cb8-a94b-5195d16eb4a6@nvidia.com>
 <CANiq72mrfavWkAz0fAqVFcGF=fXRuD9w20mbQqoT4O3o0mkdjQ@mail.gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <CANiq72mrfavWkAz0fAqVFcGF=fXRuD9w20mbQqoT4O3o0mkdjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/31/26 12:24 PM, Miguel Ojeda wrote:
> Thoughts/feedback on the matter would be nice to have -- thanks!
For the stuff I maintain I generally tell people to follow the kernel import
style in examples as well. Especially when the imports are part of the example,
as it would be teaching people the wrong thing otherwise.

I.e. it would be a bit odd if an example illustrates the wrong thing.

If they are hidden it depends a bit, and for some cases, like the one you
mentioned, it might make sense to keep it concise.

But in the case of this patch the imports are part of the example (i.e. not
hidden), so they should follow the usual kernel rules.

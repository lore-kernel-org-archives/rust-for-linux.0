Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90A92DECB2;
	Fri,  3 Apr 2026 13:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775221631; cv=none; b=XUvgg6DWkW+3+eyh5GrvOUvgJkD/0H7Kg3tbWkXzY9QZ1dvKCyuMsObB2tqY4oeRDvWEsum+gqqH34c83XtJ6v92NlZMM/oXYn1RiReyf8z9/jmJVJXi1YTgPc21FBbxV2l7gdoR69swOPdHaonHC4y6E0TIie8b/Igg/zbuErQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775221631; c=relaxed/simple;
	bh=hGc011Dl2OlnxCJ8DzUbjN3lh7EDKWyCnb/yvb7MLM0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=KGLbT8UCrj73AXXbHYGgcEsHHPVjti7nq/GqAojS7rfcczA0QOKZD4GHxkdfI8W0FaI24TVqgGBScx5OSmjBNou64uTlWM1QFkeA6Tv6pfSj/Qky/69IHvBr+N6UuJT1BoYKN5Wgu7MXUgPoOdT3Xzcj9xy2K7d2KDoBU/L8naE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ch6j0ECu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ch6j0ECu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEBF3C4CEF7;
	Fri,  3 Apr 2026 13:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775221631;
	bh=hGc011Dl2OlnxCJ8DzUbjN3lh7EDKWyCnb/yvb7MLM0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Ch6j0ECun/sj5BPmxXCfl6UIcglbh3lIEuu8cYWUCxDXUZp9BCQhmTqkJGF4mbIqu
	 4vm+L4EXvocA0WLWsZmEschMdTpy4enYIz3pU+6HXiM+hlrZFSRkMJ7dN/l3gt1vEE
	 HK5BiTIfdZPIS5yf9+260X7PHI9ca6ajndEGT+hUgStcO6OhA9+cs6+EhK9ocJdOI/
	 CIUE31cqKFrfxPysfhXgcaauh2M3ZXUd5s5e+WzDGdb5PVjsvhspOS+iLWlvBBaJzG
	 2XhkN2vKzP4PZ6mwbPfGFElicy3mBbBRXwfP7nHre3bFR9490zzZBPTGaLRi4sIJEP
	 Mn0+SGYUosIFg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 15:07:04 +0200
Message-Id: <DHJJJNP5T5FZ.2HWBMOEEKH9ZR@kernel.org>
Subject: Re: [PATCH v3 1/2] rust: sizes: add DeviceSize trait for device
 address space constants
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, <'@google.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260331224319.107082-1-jhubbard@nvidia.com>
 <20260331224319.107082-2-jhubbard@nvidia.com> <aczpifqz5CoOFB3N@google.com>
 <c42c7074-5f17-4f61-878d-414762461826@nvidia.com>
 <DHI4SCEVOQXG.1LN5Z1S7XYYLM@kernel.org>
 <DHIACQY3YL4M.3F7LSF1BZBUY6@nvidia.com>
 <f2ba20ab-7c56-4e57-ae71-06b35a696a44@nvidia.com>
In-Reply-To: <f2ba20ab-7c56-4e57-ae71-06b35a696a44@nvidia.com>

On Fri Apr 3, 2026 at 3:36 AM CEST, John Hubbard wrote:
> On 4/1/26 6:42 PM, Alexandre Courbot wrote:
>> On Thu Apr 2, 2026 at 6:20 AM JST, Danilo Krummrich wrote:
>>> On Wed Apr 1, 2026 at 10:22 PM CEST, John Hubbard wrote:
>>>> On 4/1/26 2:46 AM, Alice Ryhl wrote:
> ...
>>> The reason is that when I proposed this I was thinking of it as a marke=
r trait
>>> for "complex" types around u32, u64, etc. that we can use in DRM APIs (=
or any
>>> other device centric API) though generics.
>>>
>>> For instance, instead of GpuVm<T>::vm_start() -> u64, it could be
>>> GpuVm<T, V: DeviceSize>::vm_start() -> V.
>>=20
>> With the proposed naming this becomes `GpuVm<T, V: SizeConstants>`. Why
>> not just name it `Size`? Sure it's a very common word, but we have the
>> module to scope the name properly.
>
> I was waiting to see if anyone else weighed in.
>
> SizeConstants accurately describes what this trait provides. Size is
> too general. Again, I think it's best to name things for what they
> are or what they provide. And then, if they look odd in some use case,
> that's a hint to consider if that use case is precisely the best way
> to compose what you want to do.
>
> Anyway, I'm pretty sold on SizeConstants, so I'm hoping to stay with
> that, are you OK with it?

As mentioned no complaints from my side, but I think it would be good to ad=
d a
TODO for creating those type wrappers; the name can be revisited in this co=
ntext
or a separate marker trait introduced.

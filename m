Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291D52DAFBD;
	Wed,  7 Jan 2026 21:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767822173; cv=none; b=mjmvOhg0UFv5N5xNu+YfS88GXRuqzh5Gc19qU/Dsq2PT8fzNMzS4CdT2BLQTIqsWaWjIithxOFSw0zcOUgu4mxbbVCuCYySyy5IfzJSsHx0X3k4OuIeDY4vTY43f+9G8IOZY8Sx+COOyDbvhCS1DrIQkvkCag5ml9n6PUuyyU5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767822173; c=relaxed/simple;
	bh=3DO62lQ9BsZ7Pvl9oKTZHmdK3+XhzVHwkssJAjUPM1Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=YlnBfrIyBIvs3yVwihSshONTiByoQeqffBMqW6qsMHY2JLoU1uQlOuYNVL91Ij6yxGMSuDxMclqZYdCtNm7kOi/Z4FIr+F/zTq13Fqpz+aKbdyil8pog93F/9NLxp7mGBIp6ASW3rgP5qVmwmPiKWbr75wnqi6FatV4YNbkUfdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yb1PeR98; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yb1PeR98"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9996CC4CEF1;
	Wed,  7 Jan 2026 21:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767822171;
	bh=3DO62lQ9BsZ7Pvl9oKTZHmdK3+XhzVHwkssJAjUPM1Q=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Yb1PeR98Oe4G/EOdhH4CcSxL79ZAx7DaeQdqtiJJia2af68WiUu4VIBB889QN2JwW
	 frGNB2xddOVE85Be8IeAfgs13oxa4Nx1PjirvBacj3Woqr0mm+xM2AAGs7uW/DCvJR
	 YjNGC1KRvdHY9Ou/0XuROTivvrYO63CcAbs50B9998oxjtr1QML+wzL6thlk/EVzr+
	 Z6XIxijtdFsojwuT8P1Ty8pTmSTrmVqug4CAXFIeXl8oke4oShMDNaX+E93rm1mSjG
	 sJAMUDUhDLd17tldpTSDXLwolVTCycdTQOYK7ppbTz9w/11xzkbFLK82TPyxEz8EM8
	 ddJIRel7e9Yeg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jan 2026 22:42:44 +0100
Message-Id: <DFIONMNAAA7L.790NWN6D7VS4@kernel.org>
Subject: Re: [PATCH v2 4/4] rust: types: remove temporary re-exports of ARef
 and AlwaysRefCounted
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, "Todd Kjos"
 <tkjos@android.com>, "Martijn Coenen" <maco@android.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Christian Brauner" <brauner@kernel.org>, "Carlos
 Llamas" <cmllamas@google.com>, "Suren Baghdasaryan" <surenb@google.com>,
 "Alice Ryhl" <aliceryhl@google.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Rafael J . Wysocki" <rafael@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Igor
 Korotin" <igor.korotin.linux@gmail.com>, "Michal Wilczynski"
 <m.wilczynski@samsung.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Robin Murphy" <robin.murphy@arm.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Shankari Anand" <shankari.ak0208@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260107143935.5757-1-shankari.ak0208@gmail.com>
In-Reply-To: <20260107143935.5757-1-shankari.ak0208@gmail.com>

On Wed Jan 7, 2026 at 3:39 PM CET, Shankari Anand wrote:
> Hello Miguel and all,
>
>> >> error[E0432]: unresolved import `crate::types::ARef`
>>    --> rust/kernel/scatterlist.rs:41:13
>>    |
>>    41 |     types::{ARef, Opaque},
>>    |             ^^^^ no `ARef` in `types`
>>    |
>>    =3D help: consider importing this struct instead:
>>    crate::sync::aref::ARef
>> --
>
> This change has already been made in [1]. Probably it has showed up on th=
e linux-next
> recently which has caused the kernel bot to detect the error.

This is because the failing build was against the staging tree, which
(obviously) does not contain all the relevant patches to remove the tempora=
ry
re-export.

Now, I have no idea why the bot pulled this series to build it against the
staging tree though. But it should help to use --base when running git
format-patch.

Also, note that this patch can only be landed after all other patches went =
from
their corresponding subsystem trees into Linus' tree.

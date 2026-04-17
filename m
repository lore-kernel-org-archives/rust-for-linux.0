Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A587382367
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 07:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776411849; cv=none; b=ZMqMOZaWNIQUnJ4XhInsvBGdY/WvrcQnrsqlpizy47hxEv1BoZPKC+lYPVANNSd1T3t4t4blsaEPHRjdjrFNzNmlW20biYwP8vjYh/FHeKcWDr9Bzla+4xYW7XAk6G0dSPlLJ/vkohnbEE+n0pBa+p8mfh/d1Lwu5U8iEGNy4VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776411849; c=relaxed/simple;
	bh=eQCBnLbY+qp1QkuMc67+svubuVYoOmc+uZjlnuR5vFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LiorDdxZApT6DKfRUuLfuWPI5fZT9u3QHIpwb1tIshrNbFbYNmHkw7lnPDn4DdbXaBgJ5FLlG2oWT/fiHrKiwBtfRb/CKF6GY9us4V2oSAjtHOZnbD9jaiv3/uFJ3SYGtjOfP6fjHg5GRQj57scaJVy/gDi9/ouWrbIxuK+sLWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=mJFkuCEP; arc=none smtp.client-ip=79.135.106.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="mJFkuCEP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1776411833; x=1776671033;
	bh=QZa+Mnzu/JpBzgLh0lzaJukLWyuYJOgfdAVRo87Yl94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mJFkuCEPAC8Ljzgn/nT+d29HTVK+iOCHk87qesBbqf8A54lvToD6ZdWLs8tlm9nZl
	 ldnoyY1SmGpQIhjv8/abSy0Z86p2bg+Iz09o1wHSd7LTdooHdtOgfs3TbOKb4L28Wd
	 tvwIPWHUrUQHedszmETSAM3VbVJaEDEUeCKzvEDyxZBGS36gKV0pTvfn8HvPiSOzjP
	 4aiXQF1OHKWGudGlza5Yxp2s9iOXPj4LR+1obUp34WbgCLf/ZP2g+cZYqlBV7jdmXj
	 SaD1WthRsj88UJsdwTvMWM/zFiDSVwPX47V4NyLkkIQCy1UrBOQIK4lpu5lqQY1ECl
	 qNB+RkRwINE9g==
X-Pm-Submission-Id: 4fxn1z2NJQz2Scpl
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Tamir Duberstein <tamird@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 0/4] rust: Add helper functions and constants for Tyr driver
Date: Fri, 17 Apr 2026 10:43:47 +0300
Message-ID: <20260417074348.98280-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260417-tyr-ioctls-deps-v1-0-41c6e9bb061c@linux.dev>
References: <20260417-tyr-ioctls-deps-v1-0-41c6e9bb061c@linux.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 17 Apr 2026 09:05:50 +0800=0D
Alvin Sun <alvin.sun@linux.dev> wrote:=0D
=0D
> This patchset provides helper functions and constants that will be used=0D
> by the Tyr driver's VM and BO related ioctl implementations.=0D
> =0D
> These patches add:=0D
> - SZ_4G constant for VA layout calculations=0D
> - A task_size() method to Mm for determining process VA space size=0D
> - Updated StoreError comments for alloc() usage=0D
> - Guard::find() helper for finding the first present entry in XArray=0D
> =0D
> This patchset depends on Onur's xa_alloc implementation [1].=0D
> =0D
> The complete patchset, including the Tyr driver ioctl implementations=0D
> can be found at [2].=0D
> =0D
> Link: https://lore.kernel.org/rust-for-linux/20251006163024.18473-1-work@=
onurozkan.dev/ [1]=0D
> Link: https://gitlab.freedesktop.org/panfrost/linux/-/merge_requests/64 [=
2]=0D
> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>=0D
> ---=0D
=0D
FYI, there is v2 exist and I will probably need to send v3 to address some =
of=0D
the review notes. It's good that we have a use case for the series, I will =
share=0D
(probably during the next week) the v3 before sending it to make sure it wo=
rks=0D
for you.=0D
=0D
Thanks,=0D
Onur=0D
=0D
> Alvin Sun (4):=0D
>       rust: sizes: add SZ_4G constant=0D
>       rust: mm: Add task_size() method to Mm=0D
>       rust: xarray: Update StoreError comments for alloc()=0D
>       rust: xarray: Add Guard::find() helper=0D
> =0D
>  rust/kernel/mm.rs     |  7 +++++++=0D
>  rust/kernel/sizes.rs  |  2 ++=0D
>  rust/kernel/xarray.rs | 28 +++++++++++++++++++++++++---=0D
>  3 files changed, 34 insertions(+), 3 deletions(-)=0D
> ---=0D
> base-commit: d1d81e9d1a4dd846aee9ae77ff9ecc2800d72148=0D
> change-id: 20260416-tyr-ioctls-deps-25805eedf332=0D
> prerequisite-message-id: <20251006163024.18473-1-work@onurozkan.dev>=0D
> prerequisite-patch-id: c472a9548969ac774d36fead73378961a0d0489c=0D
> prerequisite-patch-id: 63890b91e911cf96cb42308c056d639580ac0fa0=0D
> prerequisite-patch-id: 337eb93db35359c611abe9cba299e6ab0525a2b5=0D
> =0D
> Best regards,=0D
> -- =0D
> Alvin Sun <alvin.sun@linux.dev>=0D
> =0D

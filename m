Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708A224728B
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Aug 2025 13:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754400606; cv=pass; b=syR1Rv4AI98MvOfBofudp3QR/o3d2Dp47SVt/ZKyj2YjpI8w0kIkOImwdT1ayxmc1bCash3afZz3F8HtgZmuvxK8OFvSJYhdGdzxLHeI990iZzD2hz/2O0Qi2JikI90yPBr9eKdrF+OxJQZoxM1TNLbkLyGq1EYaxGQLsiJKQB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754400606; c=relaxed/simple;
	bh=xLHaRdcJ9YdH0sI4xRZaHLmesxTgG4ahcCL8h2oh5E8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ppu72uLABIChm0XLfwd/nW3/GFkity60YoC/j4wfu4CqFuAmo/HS8Pljz/vrIgqbVthZ1FgWaJJVtnaUEfdxsjSvFoiSHpP490BLB74pPXHI9X2Smdo2DcOvWLDMG/IBBxUF7zFYD0mQ3sMRds4JS+RXz6eAnDySd8VWRtI9S4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=dqp+yOGx; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="dqp+yOGx"
ARC-Seal: i=1; a=rsa-sha256; t=1754400588; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e7gi+xc3ZFSko2fLPQQWM2Y1z3nY9UlIC4UKUESkJjrK9/6yNozFTV46E/5TvIRyWmZnGk16oHWayqAjaf2tly3ycsTu2+IaGDhu6djwykZeX8Jo5WQy8a4drrEw5aW8tOLIUb2XEriTTmxuV7W3b+0CY+dxb8Dz/ndV3fDDFFw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1754400588; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xLHaRdcJ9YdH0sI4xRZaHLmesxTgG4ahcCL8h2oh5E8=; 
	b=baYsEuMNidiyumizrfv2ISmR7dKERqY7djg2FnKTFS08PuJ3Dnr19zznSbAicIfWy5KHmNFe1AW/hqnJ+DNfx0qhEGgilADL8saOHXpJHT9a1TUw1bO7Y1GLqM78ZU+xo70PIF3Xq1OJxxhazkEnLcy+loLGdAgThLiPhX57Rts=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754400588;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=xLHaRdcJ9YdH0sI4xRZaHLmesxTgG4ahcCL8h2oh5E8=;
	b=dqp+yOGxu25lZ4ON1iWoHs2W3C93+mxo1OQt8G/WvxUvj8kITrzguGKj3AFhos9n
	CrxVnoltXp7MBG4MCLKgyRrstPl0ZFEM0VahGyxC6nR9gcbxpRTH+iUcDyjV4M9ogKx
	wVtWVx9nDc+WKg4Hbx2mjRHnCG0bC51gl5YWuYuM=
Received: by mx.zohomail.com with SMTPS id 1754400586832450.54892638418096;
	Tue, 5 Aug 2025 06:29:46 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] rust: page: implement BorrowedPage
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DBUIBXEOODEH.R2NYIGUDBZC7@kernel.org>
Date: Tue, 5 Aug 2025 10:29:31 -0300
Cc: ojeda@kernel.org,
 alex.gaynor@gmail.com,
 boqun.feng@gmail.com,
 gary@garyguo.net,
 bjorn3_gh@protonmail.com,
 lossin@kernel.org,
 a.hindborg@kernel.org,
 aliceryhl@google.com,
 tmgross@umich.edu,
 abdiel.janulgue@gmail.com,
 acourbot@nvidia.com,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B8A7994C-62C0-4BDA-A401-C788444C8934@collabora.com>
References: <20250804195023.150399-1-dakr@kernel.org>
 <731A34A7-92AD-47EA-A17A-C25FA94A5144@collabora.com>
 <DBUIBXEOODEH.R2NYIGUDBZC7@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External



> On 5 Aug 2025, at 09:53, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> On Tue Aug 5, 2025 at 2:30 PM CEST, Daniel Almeida wrote:
>> Hi Danilo,
>>=20
>>> On 4 Aug 2025, at 16:50, Danilo Krummrich <dakr@kernel.org> wrote:
>>>=20
>>> Currently, a Page always owns the underlying struct page.
>>>=20
>>> However, sometimes a struct page may be owned by some other entity, =
e.g.
>>> a vmalloc allocation.
>>>=20
>>> Hence, introduce BorrowedPage to support such cases, until the =
Ownable
>>> solution lands.
>>=20
>> I guess it=E2=80=99s a good idea to expand this part somewhat. Taken =
as it is,
>> there is no way to know what =E2=80=9Cthe Ownable solution=E2=80=9D =
is.
>=20
> What do you suggest?
>=20
> I can link where the type has been proposed by Boqun [1].
>=20
> [1] =
https://lore.kernel.org/rust-for-linux/ZnCzLIly3DRK2eab@boqun-archlinux/

Just this link is fine IMHO. I wasn=E2=80=99t aware of this discussion.

=E2=80=94 Daniel



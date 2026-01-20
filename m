Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885AB44BC90;
	Tue, 20 Jan 2026 14:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768920170; cv=pass; b=SdThfehAS2+rJeQSo3YrQiz5Ylu9JaQf9xRjIGh52DhbhGutvw+L5AgcEOiYhOvmSruwMehnL61FLXH58a6HAKBfeg838AunaUD0XAB3bbvrLtOplpAU5kbH3gSLGwmOCJlhnhn8yDZDo2Mtur0I6+FAAHCRlDPnfpmjVLCnBYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768920170; c=relaxed/simple;
	bh=FEISVfnsZ7cUpp29MJbJfBxNLEnxxLzV32Fsbo+dGlc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=f4kdOK9eLLDdDlfthVBdhKd2jbucAGMeenaofI0PedLG06BgBQMlyNKs4g8Tnx63wljhMdDI0mF9jb7ZPP4tJw1SmDc8JNiEGyw5mUD9UDujfnsPCocc8JufZAANV8dleh5nB3oQCEB+ozBeMDUGbQNkefp4frjKmG1s6tq61LI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=fVVul/vk; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="fVVul/vk"
ARC-Seal: i=1; a=rsa-sha256; t=1768920153; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cBDUiKRn7dWGj+Wf5Gkpttqj84Z16wlVEghf4vsT7+CBPOky6pYSo7R/b+0CLjFZDPb3n29MjC5M17RGeFnWNQNzAIRYJ71YDSzTmfiJwJJ6RS7m99lxpiZRFQ9Ks68U9VXGxm+KXrQ74FtjmVO/gQGYxKJbmMdLFJX5VRCx0Bo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768920153; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mYjY0h5RtTqtyeY84cGtAPfcqd3rPa2ZnEvuIXpm/e0=; 
	b=jYVEflO+XX/Aq8jqVS83DT8n3eWPisIN1kyUCTDtEkQUSg9M4Bjhubd8LCW6ui7dPE1md0a4aUx/Lw3E+iY75csH8+6QAoyVd/EkoEtCR3u8hwMV+AsEd+nNvnyfVOfukINrRfNX8rsiXk+I0sYokwA+9mlnmO7Nb+p+l6DWgBY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768920153;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=mYjY0h5RtTqtyeY84cGtAPfcqd3rPa2ZnEvuIXpm/e0=;
	b=fVVul/vkI1plhh3ZP3TitAPYBOHP5ROsYDXRMquP77WaBejnDhbBOQV3V5erTc4r
	Xn39cGHKZSq+M8WiWCExQVnR2C3zg3f4QkMwy3i53J4WH7iGDAeRrDrH4Zqrwy7OLj4
	x+PoUEcN6ZW0cMapUwvUHalNzpfgQzviEw9MqmvI=
Received: by mx.zohomail.com with SMTPS id 1768920151695790.3936926328192;
	Tue, 20 Jan 2026 06:42:31 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 0/4] rust: Add ARef support for work items
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <aW9a6KII98eI55HK@google.com>
Date: Tue, 20 Jan 2026 11:41:03 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1EBC2DFD-DA94-44E6-AD10-F892F57DFE5F@collabora.com>
References: <20260115-aref-workitem-v1-0-9883e00f0509@collabora.com>
 <aW9a6KII98eI55HK@google.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 20 Jan 2026, at 07:37, Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> On Thu, Jan 15, 2026 at 09:35:56PM -0300, Daniel Almeida wrote:
>> This series adds ARef<T> support for both regular and delayed work =
items.=20
>>=20
>> - Patches 1 and 3 actually implement the support in workqueue.rs
>> - Patches 2 and 4 adds a corresponding implementation in drm::Device =
that
>>  dispatches the calls to the underlying T::Data.
>>=20
>> This was tested on Tyr, and is actually needed in order to obtain a
>> &drm::Device when handling work items. This is then needed in order =
to
>> allocate GEM objects inside the work handler that processes the tiler =
OOM
>> (out of memory) events. The current series sets the stage so that the =
above
>> is possible in the future.
>>=20
>> This is currently based on v6.19-rc5. I hope we can land all four =
commits
>> on a single tree, but otherwise let me know whether I should split =
the
>> workqueue.rs changes from the drm::Device ones and rebase =
accordingly.
>=20
> Please send a new version that CCs workqueue maintainers.
>=20
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

That was the usual =E2=80=9Cb4 prep =E2=80=94auto-to-cc=E2=80=9D, =
perhaps we need to fix something
in MAINTAINERS?

=E2=80=94 Daniel=

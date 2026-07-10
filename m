Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7322DF138
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 14:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783693606; cv=none; b=j9VTagMuO+3tVv5BHjOl3pYQoJ0DIg2ZcTM60t9IHz5/9tR+Ar+hvqGopoPvzkkp+z+lwVhQvFdaPMNuxou6D07QSlEcpOnWG38apuC3yqyFSGyHyDvHRtqf+uzmNhs4RK826+bkAzkgcJ3bpLyCWekSpNOTfp5SFQaEOSS5jNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783693606; c=relaxed/simple;
	bh=giAq7FDyqoxaBT+603zv9Sok+grw+xMZBUJgDPRp3aw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dgOUR573AK7KBzyZ/VDG5a1VH7iXwY/sDh6qaAXnJ0d6OIt25PhhbOZZC8M3NiNEs/HU28AW28q1PxsRsisdjfJaZOOtr1LyTTY2eanfeEkXjsek5yPRG6R+MXwaXRghQNKfJnDUrA1obv64VSLQII9Mxm4Sb2IG/Y+87CydKww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jya+4wg+; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jya+4wg+"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-c15e6109f9aso94005966b.2
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 07:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783693603; x=1784298403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=giAq7FDyqoxaBT+603zv9Sok+grw+xMZBUJgDPRp3aw=;
        b=jya+4wg+i/Dx8WQATMIvYBfeDJKfcn1YaF5aVsFLm+2BpFtgXIX1idz/Fe3k29+cHz
         UMjEYXqO6wv9ELy+w4kRMWeuUCvDqYu/h/JpOQgyuH2zi3sshtqTUNVDb1n9ZQGLK0yC
         E1RhlN09WowQMRMVzTutSR85xkBxVYUbxOjnP9GonzT3BPW15mI/K5JzjE7tTXu+T0Xq
         s8ORJ/BPu1RKxO+5pjo7XCVHRu0ZFn7FW9r314W1irmLdKEq6ndqSPduADAIzpkyztWi
         +vrgTumotWmOkfPo/Uc3CkWYry4VCRb2zsDWzCQF1rbDLfauFfQ5M8PnLVRg+pv3J+aR
         cNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783693603; x=1784298403;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=giAq7FDyqoxaBT+603zv9Sok+grw+xMZBUJgDPRp3aw=;
        b=A16jlqDomKcHqAu1d4PZVMGzKgy6iZBebfhyurzJxDvAm3duaEC68IbwTL1bJbR6bT
         Eh/ZKze2AK6S1XCvUPPlFjtdz5gIF+g7MDouZ8/vHE7kpsXXu0BjxhO/HoCvud9TzsCx
         o3TpHHwK65GT83zFPZ3S/quDBt5RcGB3yetksJdPQV0NHpVtrdsrS9SLEXT1vfkh0CHb
         AYGNsrYbzvyPH/ercsbWV9RL6WAvLBLqTSxV/rvQrhBpGkXG/YVLQnF3qGlYbIv59Y7/
         qccAUSii9w/YRvHHOdeZK8TetjUDPh5DFDZi2nw/iQxVO0xFo60MYUoLFugApkCFK2RW
         FS3A==
X-Forwarded-Encrypted: i=1; AHgh+Rq6ejH9gq/Pj+kXaTH7xYYas6ZxSfRxxzCSaWRGvOycbGTwy0m+1kDTtm2/fl7sso7tsx5ARFryCMEKxSUXtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyB66kXrBO47XQuGYpQ8rP0PDYlDc7PiE2C2DLzZP2UT2R0YUXS
	AZMFCJb0o0WOplI7zlUE4q2Hv37E32DhTdD9/rvf4+o6ZITsXuddmyfdX2XnuFv6cBfU5LAuElc
	dDbLLNf9zYaB2U8GRww==
X-Received: from ejbym5.prod.google.com ([2002:a17:907:3305:b0:c12:5a40:bede])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3c82:b0:c15:e8c8:34f with SMTP id a640c23a62f3a-c15e8c80d9dmr351620866b.13.1783693602853;
 Fri, 10 Jul 2026 07:26:42 -0700 (PDT)
Date: Fri, 10 Jul 2026 14:26:42 +0000
In-Reply-To: <30e500ce-e9e6-43cc-bbdf-ded7c0ae56cd@suse.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260601-modules-value-ref-v2-1-12ebbf0510c9@kernel.org>
 <52feb9b1-2073-4fcf-b2d1-a7f42f1e72a5@suse.com> <CANiq72m3w7L5CmAsFvOpSh_jNk4jL8+A4vz8GEp+E8FY=TJcRA@mail.gmail.com>
 <30e500ce-e9e6-43cc-bbdf-ded7c0ae56cd@suse.com>
Message-ID: <alEBInX9gD1M5NAr@google.com>
Subject: Re: [PATCH v2] rust: module_param: return value by copy from `value`
From: Alice Ryhl <aliceryhl@google.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 10:13:53AM +0200, Petr Pavlu wrote:
> On 7/9/26 4:13 PM, Miguel Ojeda wrote:
> > On Thu, Jul 9, 2026 at 1:48=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com>=
 wrote:
> >>
> >> @Miguel, please let me know if I should take this patch on modules-nex=
t,
> >> or if you'd prefer for it to go through the Rust tree.
> >=20
> > Please feel free to take it through modules-next, of course.
>=20
> Thanks for the confirmation. Queued now on modules-next for v7.3-rc1.

I'm seeing this error on x86 with latest nightly rust compiler:

rust/kernel.o: error: objtool: _RINvNtCs65fqAZscXCv_6kernel12module_param9s=
et_paramaEB4_() falls through to next function _RINvNtCs65fqAZscXCv_6kernel=
12module_param9set_paramhEB4_()
rust/kernel.o: error: objtool: _RINvNtCs65fqAZscXCv_6kernel12module_param9s=
et_paramhEB4_() falls through to next function _RINvNtCs65fqAZscXCv_6kernel=
12module_param9set_paramiEB4_()
rust/kernel.o: error: objtool: _RINvNtCs65fqAZscXCv_6kernel12module_param9s=
et_paramiEB4_() falls through to next function _RINvNtCs65fqAZscXCv_6kernel=
12module_param9set_paramjEB4_()
rust/kernel.o: error: objtool: _RINvNtCs65fqAZscXCv_6kernel12module_param9s=
et_paramjEB4_() falls through to next function _RINvNtCs65fqAZscXCv_6kernel=
12module_param9set_paramlEB4_()
rust/kernel.o: error: objtool: _RINvNtCs65fqAZscXCv_6kernel12module_param9s=
et_paramlEB4_() falls through to next function _RINvNtCs65fqAZscXCv_6kernel=
12module_param9set_parammEB4_()
rust/kernel.o: error: objtool: _RINvNtCs65fqAZscXCv_6kernel12module_param9s=
et_parammEB4_() falls through to next function _RINvNtCs65fqAZscXCv_6kernel=
12module_param9set_paramsEB4_()
rust/kernel.o: error: objtool: _RINvNtCs65fqAZscXCv_6kernel12module_param9s=
et_paramsEB4_() falls through to next function _RINvNtCs65fqAZscXCv_6kernel=
12module_param9set_paramtEB4_()
rust/kernel.o: error: objtool: _RINvNtCs65fqAZscXCv_6kernel12module_param9s=
et_paramtEB4_() falls through to next function _RINvNtCs65fqAZscXCv_6kernel=
12module_param9set_paramyEB4_()
rust/kernel.o: error: objtool: _RINvNtCs65fqAZscXCv_6kernel12module_param9s=
et_paramyEB4_() falls through to next function _RINvNvNtCs65fqAZscXCv_6kern=
el6devres16register_foreign8callbackINtNtCsbtRzKR1rrUg_4core3pin3PinINtNtNt=
B6_5alloc4kbox3BoxNtNtNtB6_3pci3irq21IrqVectorRegistrationNtNtB1A_9allocato=
r7KmallocEEEB6_()
rust/kernel.o: error: objtool: _RNvMNtCs65fqAZscXCv_6kernel6deviceNtB2_6Dev=
ice10get_device() falls through to next function _RNvMNtCs65fqAZscXCv_6kern=
el6devresINtB2_6DevresNtNtB4_3i2c12RegistrationE19devres_node_releaseB4_()
rust/kernel.o: error: objtool: _RNvMNtCs65fqAZscXCv_6kernel6devresINtB2_6De=
vresNtNtB4_3i2c12RegistrationE19devres_node_releaseB4_() falls through to n=
ext function _RNvMNtCs65fqAZscXCv_6kernel6devresINtB2_6DevresNtNtB4_3i2c12R=
egistrationE21devres_node_free_nodeB4_()

I understand this is probably due to a new function in Rust stdlib that
is no_return, so probably not caused by this patch even if this is
triggering it.

Alice

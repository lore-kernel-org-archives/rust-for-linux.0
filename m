Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBAC28371;
	Thu, 18 Dec 2025 08:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766047348; cv=pass; b=SBInlfS4iSzZ+2AG5e6xH4dErbsxqg8waUdc7frCBM8otRjIvHerdtBwib85ZEtGzXeBWerhMerYa5/pQphg6pEGVIJV+ewaoFM92JN4CQ44VXFEtOolTPDao2+3t6fWpJqNkq5/6vbrArAoWv0XuOc3vNIYtldCsZq9axfMNkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766047348; c=relaxed/simple;
	bh=Gcom0mzV5dX32IFrTvyHumnxxI65W2wbIlnMfr10cHQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=qmF2NGiT7zNkUai5wD0RhYir8PUkUPoC+cgVVc6/a2LAmlnrE5Nl1YJrE1UcG67+GkGLvVlMf3csDU4n9SUMK+slRi3rTXfs/ABVjKTHxH4WKz4qa7uR1Yg/XXPNKKughdH69x9hEmfMYyWy6UZI/zYZM0FB9mQ/8Ld3HOZ56qY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=hbbjC8/S; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="hbbjC8/S"
ARC-Seal: i=1; a=rsa-sha256; t=1766047328; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OcblA8MxWXRPIwSKpIkq38yPI44Ll2cK45blhzzquf1Y17A4NgbmCzB3nCQLErnXieZDB/eD7emJX2dHGqo3hchL4QJTUTGzaUgTu4M7PzfENebtOn6EzbKFBlInWmv5Y738aFaLqPAhvT8iysifUvlc4OOc+sd+Bp3oxuJia9k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766047328; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nH1Znvs6tZ6lNUDPGJWJ9TLngBBRlpIRRKnddczDCJ4=; 
	b=Rug8HVOsUjRkniX2t4a0iGR3PgqxvH+Ukz6FZT9MZH38AoSsVwwGM99BAmke2bHiSmQk2YuOje2dMQ1gcy2iwNYJlhwhScPsy82pf8Cz7Mgm8tjP6MibhLvJ+e56n1H0ray72wxWiUGQXiwYHBmYArJ88nitmhZ0/IKPnO2z0pY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766047328;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=nH1Znvs6tZ6lNUDPGJWJ9TLngBBRlpIRRKnddczDCJ4=;
	b=hbbjC8/SxKUz8uRONv3tr8Q7YdhT0yZgNHEEK4jlIQMfYv+LFKZh4RiMkBxIwxIf
	zwlaAxkF0Q6W8EK0tp9uKc8lB/SQMamGq/plypXV4XM7ZEBFuVdI3AdNOuPQd4ZyfMC
	GPXfGktbigcsOBXILscgkfNXoh5FahgogwpIvMY4=
Received: by mx.zohomail.com with SMTPS id 1766047327746849.8607620614057;
	Thu, 18 Dec 2025 00:42:07 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] hrtimer: add usage examples to documentation
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <87ms3guqxo.fsf@t14s.mail-host-address-is-not-set>
Date: Thu, 18 Dec 2025 05:41:52 -0300
Cc: Boqun Feng <boqun.feng@gmail.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Lyude Paul <lyude@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 John Stultz <jstultz@google.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B10A2EE1-C5A7-490F-B85F-82D5C905DE7A@collabora.com>
References: <20251217-hrtimer-examples-v6-19-rc1-v1-1-4ad0e7e4c4e0@kernel.org>
 <ppzmlAVupzBwfQchQvMLdXNjAU_JEy5uR-s2OhGLegkP3b32qNl67HZIMbZJ1Yk5Yj1MGBTG0TLFQ4vAbW8rcg==@protonmail.internalid>
 <C1C6DB90-202A-45FF-9D01-D7304A8DC8B0@collabora.com>
 <87ms3guqxo.fsf@t14s.mail-host-address-is-not-set>
To: Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 18 Dec 2025, at 05:36, Andreas Hindborg <a.hindborg@kernel.org> =
wrote:
>=20
> "Daniel Almeida" <daniel.almeida@collabora.com> writes:
>=20
> <cut>
>=20
>>>=20
>>>=20
>>=20
>> FWIW:
>>=20
>> [10:52:46] [PASSED] rust_doctest_kernel_time_hrtimer_rs_0
>> [10:52:46] [PASSED] rust_doctest_kernel_time_hrtimer_rs_1
>> [10:52:46] [PASSED] rust_doctest_kernel_time_hrtimer_rs_2
>> [10:52:46] [PASSED] rust_doctest_kernel_time_hrtimer_rs_3
>>=20
>> This looks good to me. The rendering looks ok as well.
>>=20
>> With the nits addressed:
>>=20
>> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
>> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>=20
> Thanks for calling out the sloppy error handling, will fix.
>=20
> I don't understand what you mean about blanks?


e.g.:


> +//!
> +//!     fn run(
> +//!         this: ArcBorrow<'_, Self>,
> +//!         _ctx: HrTimerCallbackContext<'_, Self>,
> +//!     ) -> HrTimerRestart {
> +//!         pr_info!("Timer called\n");
> +//!         let flag =3D this.flag.fetch_add(1, ordering::Full);
> +//!         this.cond.complete_all();
> +//!         if flag =3D=3D 4 {
> +//!             HrTimerRestart::NoRestart
> +//!         } else {
> +//!             HrTimerRestart::Restart
> +//!         }
> +//!     }

There are zero blank lines here and elsewhere. Makes the code harder
to read. I am simply suggesting:


> +//!
> +//!     fn run(
> +//!         this: ArcBorrow<'_, Self>,
> +//!         _ctx: HrTimerCallbackContext<'_, Self>,
> +//!     ) -> HrTimerRestart {
> +//!         pr_info!("Timer called\n");

<blank line>

> +//!         let flag =3D this.flag.fetch_add(1, ordering::Full);
> +//!         this.cond.complete_all();

<blank line>=20

> +//!         if flag =3D=3D 4 {
> +//!             HrTimerRestart::NoRestart
> +//!         } else {
> +//!             HrTimerRestart::Restart
> +//!         }
> +//!     }

=E2=80=94 Daniel


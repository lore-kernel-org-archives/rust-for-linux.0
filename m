Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8600A347FD3;
	Wed, 15 Apr 2026 23:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776296715; cv=pass; b=ovBLkKkCVVnerzsvv7ke2ER4JGiuQ4i2hmf++iX732vggq2S/+aR3ivLW3RBACzMfNdWm3gTxgaA1uWWXI3A9nBXFs0Fx0ev4SydGWkCXht9+jQNVD+d9KT4uW/9Y2bI0qKEda+Kq1qtNmExJ6tFjRwYyiK7EEG66alGMM1fmMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776296715; c=relaxed/simple;
	bh=s7XTHIXVT2olNZkv1+B91HoreKwOAAvGI3RKDDlGMzk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=hQu+HRWwy2Fax9Ur0AEtTeNwuY6KKN9SwzYsaKcES766UlR0YZZByz6xgYYK3Bo3C31+MNfMLSHNE6K1u0fVwnFG/MACCmoDXSTzc0W1ikgCpz7Bd8FkWW5/rFUUPg76cWLNvwyxjOAg9p9kb7tkTqwZl5u6ZRAbn8oLoyrXizw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Jgj1xmqx; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Jgj1xmqx"
ARC-Seal: i=1; a=rsa-sha256; t=1776296685; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gwFAuDUO2EYEShm0OaBdoUmWog6kJfjYklRiy4Hu3DqxYxeMxxv0MaWOJUcY2HpbvxYxoO7Qk6EOU09re4O86Y6lFqw3HMCek+OhiuyvFq3ER1KMGjYhTrd6G41sOuhwTY+t+tnrCeD9bza8SqyLukWy8UIeqiL3Kvg4dtx0DTQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776296685; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=s7XTHIXVT2olNZkv1+B91HoreKwOAAvGI3RKDDlGMzk=; 
	b=ZjlOUk2Y4oqc/I5qPy4+mE0AnDxlDvXMmKve1E/+dB8cOHQjGB2BIOt3qKWBJ/x3IYFj/Q0lFxSv+V5bYqBUYWukV4/lJcDZEYit4Bp95YnhNLdYQJY42yAsfWy9y14UTQO5SkexCvxuA8W+HgrS/5pqWT1GfzJfxvx3hEs1nO8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776296685;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=s7XTHIXVT2olNZkv1+B91HoreKwOAAvGI3RKDDlGMzk=;
	b=Jgj1xmqxApw9XMi0ILRcx7RRQpE3oSO4CVeYNKQGaSozEiJjP3Fuydl3gUmHfsF/
	47qRBLc7Kh1Xf4H39nMeliMK+SPAAXsfRfO8iLZf33fX01sj33FwOo5EwGartXJV/+P
	Zv5sipX0jppDTq+uVtukCnP6afZoty6KORWks9i8=
Received: by mx.zohomail.com with SMTPS id 1776296683719210.53603348591741;
	Wed, 15 Apr 2026 16:44:43 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] MAINTAINERS: Add RUST [SYNC] entry
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260415232830.8128-1-boqun@kernel.org>
Date: Wed, 15 Apr 2026 20:44:23 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>,
 Waiman Long <longman@redhat.com>,
 Lyude Paul <lyude@redhat.com>,
 =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Mark Rutland <mark.rutland@arm.com>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A2BA50BF-B012-4747-8D5D-6E4F13B281F5@collabora.com>
References: <20260415232830.8128-1-boqun@kernel.org>
To: Boqun Feng <boqun@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 15 Apr 2026, at 20:28, Boqun Feng <boqun@kernel.org> wrote:
>=20
> We have two pull requests on Rust synchronization primitives with 10+
> patches in a row for recent cycles, so it makes sense to start the
> effort of handling this area as a group.
>=20
> Luckily for me, Gary Guo and Alice Ryhl agreed to help as
> co-maintainers, and we also have a talented group of reviewers:
>=20
> Lyude Paul started the SpinLockIrq work [1] and did an amazing job at
> improving the design and implementation.
>=20
> Daniel Almeida resolved the Lock<T: !Unpin> issue [2] and he did a =
fair
> amount of reviews in areas related to synchronization primitives
> already.
>=20
> Onur =C3=96zkan started the ww_mutex work [3] and did an amazing job =
at
> consolidating various design requirements and decisions.
>=20
> Of course, this only reflects my own knowledge, and I believe they did
> way more outside what I'm aware of ;-)
>=20
> Note that having this MAINTAINERS entry is meant to bring more people
> to help on the synchronization primitives in Rust, which means for =
patch
> submissions and design discussion, please still involve the
> corresponding maintainers (e.g. LOCKING and ATOMIC),
> scripts/get_maintainers.pl should have this covered.
>=20
> Link: =
https://lore.kernel.org/rust-for-linux/20260302232154.861916-1-lyude@redha=
t.com/ [1]
> Link: =
https://lore.kernel.org/all/20250828-lock-t-when-t-is-pinned-v2-0-b067c4b9=
3fd6@collabora.com/ [2]
> Link: =
https://lore.kernel.org/rust-for-linux/20260103073554.34855-1-work@onurozk=
an.dev/ [3]
> Signed-off-by: Boqun Feng <boqun@kernel.org>
> ---
> MAINTAINERS | 14 ++++++++++++++
> 1 file changed, 14 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 55af015174a5..220dee78b225 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23183,6 +23183,20 @@ T: git =
https://github.com/Rust-for-Linux/linux.git alloc-next
> F: rust/kernel/alloc.rs
> F: rust/kernel/alloc/
>=20
> +RUST [SYNC]
> +M: Boqun Feng <boqun@kernel.org>
> +M: Gary Guo <gary@garyguo.net>
> +M: Alice Ryhl <aliceryhl@google.com>
> +R: Lyude Paul <lyude@redhat.com>
> +R: Daniel Almeida <daniel.almeida@collabora.com>
> +R: "Onur =C3=96zkan" <work@onurozkan.dev>
> +L: linux-kernel@vger.kernel.org
> +L: rust-for-linux@vger.kernel.org
> +S: Maintained
> +T: git git://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git =
rust-sync
> +F: rust/kernel/sync.rs
> +F: rust/kernel/sync/
> +
> RUST [NUM]
> M: Alexandre Courbot <acourbot@nvidia.com>
> R: Yury Norov <yury.norov@gmail.com>
> --=20
> 2.50.1 (Apple Git-155)
>=20

Acked-by: Daniel Almeida <daniel.almeida@collabora.com>


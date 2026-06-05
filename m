Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCCC3CF693;
	Fri,  5 Jun 2026 15:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780672534; cv=none; b=C+IvUt2Miv9v0fHVxU2rUDrD+8UYSqdrMvd2D4PjPBezjEIRnydwabsVCu/Ugldspag5JJrGwkNaluzkzNCqy/C0Pqe004ImYo6A7FoSeJbCspH16nOXcYqvwxiLW7iUe13VP5YsnhrQKBA2doq4e4faf3ia2vezkZxfQlmGNYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780672534; c=relaxed/simple;
	bh=efjpmt0tSacNlIg1827ocaHBfa/q3Wj5XMD4Vq67/s0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=GosLv+/ZyJnqS5dEz3i6KIMyzdNlQ3dBw/zZYR9SKDDRoKzGRL7pg48cP/6arl7ZkGyk1EVuT0ZGckwz1r+EupZ15OJ6vboXEe+RLdMHuW7m4yeNX2QV/4m7xgdD1gVAbF/VyYA+cc7lqCHnpr00w9HMljoF+C/jr1ZKhVlaTr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/LST3rA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/LST3rA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3272D1F00893;
	Fri,  5 Jun 2026 15:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780672533;
	bh=9hu0o0fyp20w7TIliLFLcpValiU7Db1HDsBy9VVEPVw=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=A/LST3rA7KUIeIGHI7O0N0Vc2oaxbsiSW365Mn4PUJcOqTIzqXelzxVwOmTi0o8Gj
	 GMXiLWcRyvvZ+szm4vFJzhJRccjP4ueMyMrE3DyIUwGtIWDhWW+L+xvwb3O9iZ7bdt
	 o0fCIrMXxKTH03I5eJ5UC9eXb5i984raH2/lEsMOamSQFC/A8oITq/p3m45JTs36cs
	 mEbMlxpPO3oJlycNgfurvnWHLyS3ROcECYHb6Rlfst24KRau2cZwwiDBnYvjcKfqXj
	 GvQeI5BAlHxHb9u1AvgSusnjvKJoUL3j45/7j7rKdjzVZLyTitg1EcEyaZh4pIy3zT
	 OKSNuuaTO5GWg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 02/11] rust: xarray: add debug format for
 `StoreError`
From: Tamir Duberstein <tamird@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Tamir Duberstein <tamird@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
 Hao Li <hao.li@linux.dev>, Daniel Gomez <da.gomez@kernel.org>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, Daniel Gomez <da.gomez@samsung.com>
In-Reply-To: <20260604-xarray-entry-send-v4-2-965f6028790e@kernel.org>
References: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
 <20260604-xarray-entry-send-v4-2-965f6028790e@kernel.org>
Date: Fri, 05 Jun 2026 11:15:13 -0400
Message-Id: <178067251341.96312.1551479010624701516.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=713; i=tamird@kernel.org;
 h=from:subject:message-id; bh=efjpmt0tSacNlIg1827ocaHBfa/q3Wj5XMD4Vq67/s0=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFlKL9hfvjU39bJQLn/Rb/T6YMm+rbucQmx00qZoGeyXP
 3rg4Ma7HRNZGMS4GCzFFFkSRQ/tTU+9vUc2891xmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAK56FSPD9j2Ga3TW/xQ1+2PscvVO44GYA6HFfTy+v4sDPwj/2i7Vw/CHZ7HNDzU
 2z61/DOVW6b6p9Vj8c6bi7o1bpi+8dvDdrdzprAA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

On Thu, 04 Jun 2026 21:58:08 +0200, Andreas Hindborg <a.hindborg@kernel.org> wrote:
> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> index b80fb7a262d0..d54942aeb201 100644
> --- a/rust/kernel/xarray.rs
> +++ b/rust/kernel/xarray.rs
> @@ -193,6 +193,14 @@ pub struct StoreError<T> {
>      pub value: T,
>  }
>  
> +impl<T> kernel::fmt::Debug for StoreError<T> {
> +    fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
> +        f.debug_struct("StoreError")
> +            .field("error", &self.error)
> +            .finish()
> +    }
> +}
> +

Maybe an import of `kernel::fmt` at the top would be cleaner.

-- 
Tamir Duberstein <tamird@kernel.org>

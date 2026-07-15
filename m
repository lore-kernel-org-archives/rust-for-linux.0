Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4933590AE
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jul 2026 14:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124565; cv=pass; b=RYw8O0oxhgkdTV9m1MoLPaEzGoJF5SjKmUX+OZ3oBIvpFIn8hy/D5jv+ENRngsWqsIfSDwXnjX0Y4gKcs+R/iDRJlLDlx22WR1vBfpxtyRVeU1vnHPkgyzHcgBDiQQH/8NjAWy7nTYvLMQ04xfdKxKT/PCvvQ8DzrHRdLqTf7bM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124565; c=relaxed/simple;
	bh=SNqsn1X2G8kP/+EM1dJk3CmM2TUfgksbckY1LKNvZHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Otrcd5JXG8J7yupLjZg0lKsIzIWyIrbpsMzjKNB91+ele2w2ilaPJUjxBdwGFn3kt+O/OVRZt1pzlOZXa9QAfo3RpUp8/oA5xdrYeFJgGVn6FUmyMa6Yc7ylXdo4ntHpxbG9ojk+UivHHrWsQCcOe3e8GBqnKPMsO+uPqeDTrO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UaSfAw47; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UaSfAw47"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c7902f47so46474865e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Jul 2026 07:09:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784124561; cv=none;
        d=google.com; s=arc-20260327;
        b=U3bdQGUtQwwDmm0o6yHwJtNFLfGWcUrTW8T+/RDWLtThmdnT5r5v8r03fVGnCDhGWs
         PpFIoC4CxEWx/IIHrrxxV4I94A8v5ezZSgiG3+G53gp3en9Yhl4g2bWuVbPL8ML6tXIi
         QDk8g6vfPJLy7yshVIH1+eS0sjIJ8ibaIq5YFV5hOpnpI41hxU8hH0nVoFqabPUZHrnl
         4TR1U1vm+Kdyxu37r9u/VNv1LTlqbsaZ6lQtlfTdWGx78dwjeU0kfhsTX7ks2jgrlJdY
         TZ/7naxq46v6NTPfrmP3oX1AbD+HEbMhbMe3Wyzn9CJMzDvSOGcJdjlo8RTRGdpQWlvC
         nodg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1mcx5kizqsJiWKU3Assktv3idKETuJ14oVMLxFKExzM=;
        fh=eoyyu4dAYNnZ9JI4/wy4/7SEsgSEoMkQFx1xOeLcb/Y=;
        b=GBOA8E4A8DVDvC8BWjZ0OrRu89ymXGzPit12iLWfTBouDoMGtfeCq3HUn+EPJvNSAR
         EnuIg+09fFRkn/rIrw3Hff/MSdV7uilwtpDREN2NXc+F+YqE0jxbFkMq0IdNERYcT/O/
         qx2jTsN6x6tzqD8O1rcyrQI6015h4X5amgLHPwXpfVhV2NUDQFeoD0o8oItKSqsrcL5y
         jw3pB78ftIuGAxE17CLEpg9DsuluUop6wuoCOMDyVHKnNcH0fv3hn2NQUm0WGuJs1LaQ
         vl17WTAnd+76fuxfWocGNbp/PdNtpMuTh5W5irDci2q5DGnU34HGoMNIwVYwYAM8ouno
         tYOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784124561; x=1784729361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1mcx5kizqsJiWKU3Assktv3idKETuJ14oVMLxFKExzM=;
        b=UaSfAw47mfe2To7mpkFVmc5n0JVKld4Zp9BlmAHPqKKjxaAcOi8Gc53dGuMtjTJkot
         30OkIQx/GnCqe1zn9XcxNT+x5qXde9tenGtZDyE4It6anCRuW/ZjtNCqrLfWi8K/4fnh
         IZXtQsK3I6YA2J1hoa7mLqfndnPAJPLGyJOJMkp/h8KOTYBX6cMrXxXNMT4fdByR6CGN
         BSG6+u7Y733zuJuayhDf4DZiXRLfsEq6m9/ZcPk1pBEPRhEsQ2kfqLapk2yODzQEiVVN
         LpoMEYzQZ4oaZ7Gg8QZuI/uIWZiu9JfYSv2atUROZuUEa9OQZxdVEuXf3eJrDSv7nZJB
         JCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124561; x=1784729361;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1mcx5kizqsJiWKU3Assktv3idKETuJ14oVMLxFKExzM=;
        b=gzWnuGSqcvF+CQ4XD1D5/vTRjDOrIgHmWPOTncKDBTcmdCsC4DGiEiE+C3AMbbJNYB
         Ph9t88H8mG/QWY1+1TTQJMqDRSvifUE/McsE+Qjno27mDXgbi0ImUeGnMgeXBBepdfah
         84JB70a7RO08ensrFKJi7iuwA2Jnv0s21RdJqLPfoMoe14FJr0bqu+dH/FXPZNagA7tB
         R4SoG3si6K7Vm0aGupFxoHD0+2R3KD9G9TDcZPR8gvpblnwtifrPgiDpr8ZeJRE5apTA
         TIre7IAhFX2+pNnvokxszK2l6BM2j0e0CJHo5X9Rguj+RuuRR8+VtZJOYQzQkX7pvy7t
         AnLg==
X-Forwarded-Encrypted: i=1; AHgh+RrUWfNItbu0VDBbobR+jrnTMxmqnS6/NvwG7YRNKdfczKc54uI6d/eVW3KKHk3GdeV7cKgJyFyliRAykQXvmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh8qcaOm5tQvhOoBktSt6ZLvQhcT1I2tJObooxNtkhmHDZev1+
	BseaVQLH2FKjG8JJFAXWgT1yTj/clQB0aHW9hj6wAmcWTxQa4PLHh9z7zaRBoG10w8UQtlUHg0X
	9ou0eZ/jTcQdajlkgeKA6EaSTIITNuhTos2PiSMRM
X-Gm-Gg: AfdE7cnuabY/8hg2hRRcOeZTZtveC/4aAnK0IHpdJ/3xmC1FZW9ghGB5sGwm3hxunVq
	lo/XCvD9TIyGJprA7sUb7D0jSp3Lf+h0PlM+rJFnORDi5QZzfFqEtlpND5i22D5jodU390ESH5P
	7UEZ/RGIx17ZEonYowNgbdnOWsIXpcMzE/WNpsvfbyMprkV893JJeXd6QWnVROG3J96NotgjMvf
	+ybYcO7/hq1u6A/tFuuQWkvmfZf+/FuvA5uNxE+fkgx1XLFFspFkY4jxOz1H7O2ibJtTwGiL9pD
	ezQykgmw09owosHk3bDM4sLOJqg=
X-Received: by 2002:a05:600d:8443:10b0:495:404b:85eb with SMTP id
 5b1f17b1804b1-495404b8636mr4530305e9.26.1784124560869; Wed, 15 Jul 2026
 07:09:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605133541.22569-1-boqun@kernel.org> <20260605133541.22569-5-boqun@kernel.org>
In-Reply-To: <20260605133541.22569-5-boqun@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 15 Jul 2026 16:09:08 +0200
X-Gm-Features: AUfX_myXsOMxqzySIL_c6wjy_KTMgParE-LvwcdXFSkdOBkOsDSHqrVd6QhTOvc
Message-ID: <CAH5fLggHxeDMm1ygYEGPpjCdfRD8nEsgN31WMvjX3mMPs5p5yg@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: maple_tree: Add load_rcu()
To: Boqun Feng <boqun@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	rcu@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Andrew Ballance <andrewjballance@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	maple-tree@lists.infradead.org, linux-mm@kvack.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 3:35=E2=80=AFPM Boqun Feng <boqun@kernel.org> wrote:
>
> From: Alice Ryhl <aliceryhl@google.com>
>
> Now that we have a concept of rcu-safe containers, we may add a
> load_rcu() method to MapleTree that does not take the spinlock.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/maple_tree.rs | 52 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>
> diff --git a/rust/kernel/maple_tree.rs b/rust/kernel/maple_tree.rs
> index 265d6396a78a..1499191b8935 100644
> --- a/rust/kernel/maple_tree.rs
> +++ b/rust/kernel/maple_tree.rs
> @@ -16,6 +16,10 @@
>      alloc::Flags,
>      error::to_result,
>      prelude::*,
> +    sync::rcu::{
> +        self,
> +        ForeignOwnableRcu, //
> +    },
>      types::{ForeignOwnable, Opaque},
>  };
>
> @@ -233,6 +237,54 @@ pub fn erase(&self, index: usize) -> Option<T> {
>          unsafe { T::try_from_foreign(ret) }
>      }
>
> +    /// Load the value at the given index with rcu.
> +    ///
> +    /// # Examples
> +    ///
> +    /// Read the value under an rcu read lock. Even if the value is remo=
ved, it remains accessible
> +    /// for one rcu grace period.
> +    ///
> +    /// ```ignore
> +    /// use kernel::{
> +    ///     maple_tree::MapleTree,
> +    ///     sync::rcu::{self, RcuBox},
> +    /// };
> +    ///
> +    /// let tree =3D KBox::pin_init(MapleTree::<RcuBox<i32>>::new(), GFP=
_KERNEL)?;
> +    ///
> +    /// let ten =3D RcuBox::new(10, GFP_KERNEL)?;
> +    /// tree.insert(100, ten, GFP_KERNEL)?;
> +    ///
> +    /// let rcu_read_lock =3D rcu::Guard::new();
> +    /// let ten =3D tree.load_rcu(100, &rcu_read_lock);
> +    /// assert_eq!(ten, Some(&10));
> +    ///
> +    /// // Even if the value gets removed, we may continue to access it =
for one rcu grace period.
> +    /// tree.erase(100);
> +    /// assert_eq!(ten, Some(&10));
> +    /// # Ok::<_, Error>(())
> +    /// ```
> +    #[inline]
> +    pub fn load_rcu<'rcu>(
> +        &self,
> +        index: usize,
> +        _rcu: &'rcu rcu::Guard,
> +    ) -> Option<T::RcuBorrowed<'rcu>>
> +    where
> +        T: ForeignOwnableRcu,
> +    {
> +        // SAFETY: `self.tree` contains a valid maple tree.
> +        let ret =3D unsafe { bindings::mtree_load(self.tree.get(), index=
) };

I think this is only legal if MT_FLAGS_USE_RCU is set on the tree. :(

Alice

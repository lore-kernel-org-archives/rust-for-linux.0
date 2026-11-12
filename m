Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487734;
	b=E/V1B7OeUcKaTgLTja5+VZyJgU7hAlpTWRmnWP93ZujQkCseH1iy6CdGH5WjJzcHztnC
	 EpZsPAr3CKrFD5m7Ho4XE6hDir3UFL2kpwedtn+1YGKMF/uFK7wOtlDEA12OOWqBTJww3
	 25QV1TsH0H8iwfNp7JkwqSXcutc7iKYSlJwFb+igsqda182v5oA/MZd3iZsG51+5E0noU
	 0RxYeoruy9crZpGAfnlw2nXP8e3SnPnjolwLe/nh188c1A/RcOal3qMRjmbjZtRp6zAqK
	 S35wHafT/9TgHNwUI5CE6CnWkfQVc0DHwVr2G1lAd7/fNmhdKp+zav9zow+YPk7FAAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487734;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=KpTLclEcFCIMvdo+hdA2NeaNnjk3CbC/MSnVhaYm/Nw=;
	b=Q+gI3FRZ6rr/QqcJXW+ZGB7+tUBv6VaY7Zi+JnfAF4KrPvVy9CLIA4goNznP63Rhcov1
	 7AFUfUIS20fksiH4o/b9ESBfMYnUwIZScprT4Zukt9XHJMnDCA4OHDEMFJ8a8vJGGO3Q0
	 3qb3SNeLv1TlYVp3lpnDQKdqPqDYmfDK7XwkaixIcqD0i+V5ILWtoENcc5a2u6XnSU4bI
	 MEp1zgE4paHFH0Kopjr2khTgbpv/2wI8JKD4NYHQsdyJ1WLzZSUG5ZF1OP/9tqtfmD1YG
	 01tRGg8j0QxkPhh8vUsYR2+2BH9CSCDAXEIiriWBqeqaAt8i4PHv8ucVxylPSX68K1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="iLlW76L/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1240606A331;
	Thu, 12 Nov 2026 12:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iLlW76L/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8371F00A07;
	Thu, 12 Nov 2026 12:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794487733;
	bh=KpTLclEcFCIMvdo+hdA2NeaNnjk3CbC/MSnVhaYm/Nw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=iLlW76L/KPQ8InlR/LCWAUEV5s1sI18kR0rGl+n5OsZuUj9ToSUeG3dgpW30VhWRQ
	 0AVCgkOzEZVKOaFn3uC+lCnJ51PFFoI960zA7VD6962Y470OwRSoWGwhJD/GmEnI7w
	 wD4GPId+iojAHAWu5S9Wm6/AZqIdgIirGrJK9Rqbg2nvEuP74iQb/tnpV4adTW5uQh
	 tTtpln5M5hB9axwSjP2rTNBP4fgYFeSeWB1ZLZUWEKe72XCCOMMgFMTxPZPd3w+klA
	 AsYuZAHpCXhv/bEYD6lTr5JXLoa7RbKTRCzweZVQd+tR9DsNnWj2rDPq0FQgxUJGkv
	 r31ykT4RRko/Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: ojeda@kernel.org, FUJITA Tomonori <tomo@flapping.org>
Cc: acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de, 
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
 daniel.almeida@collabora.com, frederic@kernel.org, gary@garyguo.net, 
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, 
 tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20261102000102.603124-1-tomo@flapping.org>
References: <20261102000102.603124-1-tomo@flapping.org>
Subject: Re: [PATCH v1] rust: hrtimer: Remove HrTimer::expires()
Message-Id: <179448764515.621816.8279390929279988225.b4-ty@b4>
Date: Thu, 12 Nov 2026 13:47:25 +0100
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Mon, 02 Nov 2026 09:01:02 +0900, FUJITA Tomonori wrote:
> HrTimer::expires() reads node.expires without the base lock. The
> hrtimer core writes node.expires in hrtimer_start() and
> hrtimer_forward(). A timer started through Arc<T> or Pin<&T> can be
> started or forwarded while expires() runs. The read then races with
> the write. That is a data race, which is undefined behavior in Rust.
> The volatile read does not help.
> 
> [...]

Applied, thanks!

[1/1] rust: hrtimer: Remove HrTimer::expires()
      commit: 6b391eec2ddeb3ab2681cc5dee16d29e00202438

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>



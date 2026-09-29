Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C434FECCC
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 10:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677237; cv=none; b=NgLb0ik+nYygk2FVTx2V0buBp6JmcPIybl0LxFLWGO8oLD14VNF0+jeorXWKBCE8b8qX9XiqM9ZGm5fPdt+8zK2P5FRwWiJgGy1/TrQoCakJLyCnk+EEd2tBLu96/S/WU2l80bJJrl82BCsCzeK/Kr/V+OnTB1GwPj45ZWMFpHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677237; c=relaxed/simple;
	bh=k9nTI70uK1E/cuewdG3pvLWFWDrlQWWSkSkR3Ehz2u0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OYmKDRRuwdZWC1VvdOKcRjLOA0rT+2JhUXqpMI2J1QPSlnHR8OC802u9I4NAIJXd0r1KPh7tqfUu6KqVFCKICx5znq+RQ5P6TG6frdwMTTL7QXiN8X4tHwM8e1EU9pb/hNl2jBk49q5RhAd64zoBpdiYX2gpFB2JqQ2YAJwSFH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCtlsAMi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCtlsAMi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3FD31F00893;
	Tue, 29 Sep 2026 10:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790677233;
	bh=a//LDogqFag21Wkg76o45xFfaNlgfP4Zv38MCnNyVVM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KCtlsAMiPl+EwGlv3h1+rPcMlRvTUda801HThgfPo+6h9r7WFNPP6hlucjKgwGsEw
	 5BaNlAQZVt+TBz+oD8y0zO3Hq5GO2tcnAvYabcSKTSx6cwBJap/S8B6FNWB5rBAGAb
	 mWly+NNIgulWw3o/Y6RW2+Wl8ICOxxFtS4hFi85qflRRngmg/14rctwo2hvtwnYIBs
	 JXFP+ljnu/dRepFWJgeQ41yKkEG2nJB+m72HDhX8KyamRdhThD3H03rcjPYH8JjEs9
	 OI92xoG0vg2m3h6xeo+f+jSdybYvJztKgzFe4sqmBoZ0py72ZU9c5YmwCBey0vX8T9
	 cJQsDR3YKwBcw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Boqun Feng <boqun@kernel.org>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@kernel.org>, John Stultz <jstultz@google.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: rust-for-linux@vger.kernel.org, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
In-Reply-To: <20260621105909.4055210-1-ekffu200098@gmail.com>
References: <20260621105909.4055210-1-ekffu200098@gmail.com>
Subject: Re: [PATCH v3] rust: time: warn and assert out-of-range input in
 fsleep() and udelay()
Message-Id: <179067695516.2043960.1478743875056457177.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:15:55 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Sun, 21 Jun 2026 19:59:07 +0900, Sang-Heon Jeon wrote:
> fsleep() documents out-of-range input as a bug but does not check
> it, unlike udelay(). Add `debug_assert!` calls to catch it in
> debug builds.
> 
> Also add `pr_warn_once!` calls in both fsleep() and udelay() so
> the clamped path is observable at runtime.
> 
> [...]

Applied, thanks!

[1/1] rust: time: warn and assert out-of-range input in fsleep() and udelay()
      commit: 125a931f9d7f0fd93037f1c8c8154ab5b19678c8

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>



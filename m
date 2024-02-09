Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95F553398
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Feb 2024 17:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707500298; cv=none; b=T8PSYsaMHoHykhYynBsf+eBXaiHVXj+yKE8K7goWuzGaaAJ+6vplvaek5AvqsyGl3nxP8C1rbHd/QJOBX6JGXnKjDSYQXroqwtuQmOTA/n4bCd6VbGyK1xebkj7CPM3M5QHaqeoG5ssyzzCM5TlyZ52xaywBFHOy/JLGVl7l7nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707500298; c=relaxed/simple;
	bh=IiFlz/2jOsirPubtEY3LcZ5hI0itMVRIK07CKtD+kA0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UTiQx4/5ApQCeCsYgnspFwuaEPXCQbTA6Pv4vh+ZsCE3Cq3VsRPe2FnO/JWz59TdmEWYQmP8SiKirxkZBPWI11yJoe5hELy0G1Qea6KhPwbT3G63Aamv/T+mcmf2R/VKm0OG7iMoOBgpr3cTR3T/qGObIsvN4eqnk7VFUgvVSsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B787FC433F1;
	Fri,  9 Feb 2024 17:38:15 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	steve.capper@arm.com,
	Asahi Lina <lina@asahilina.net>,
	boqun.feng@gmail.com,
	andrew@lunn.ch,
	Masahiro Yamada <masahiroy@kernel.org>,
	WANG Rui <wangrui@loongson.cn>,
	Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v4 0/2] Rust enablement for AArch64
Date: Fri,  9 Feb 2024 17:38:13 +0000
Message-Id: <170750002897.1210949.14507303616035197246.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 20 Oct 2023 16:50:54 +0100, Jamie Cunliffe wrote:
> Enable Rust support for the AArch64 architecture.
> 
> Since the v3 this has been refactored to split up the x86 Makefile
> changes. Updated the x86-64 conditionals as suggested by Boqun and
> addressed the formatting issues Miguel raised.
> 
> 
> [...]

Applied to arm64 (for-next/rust-for-arm64), thanks!

I also folded Rui's loongarch fix into the first patch to avoid breaking
this arch:

https://github.com/heiher/linux/commit/c504d83a6edd963e2ba58ec538e3f06da78b187e.patch

[1/2] rust: Refactor the build target to allow the use of builtin targets
      https://git.kernel.org/arm64/c/f82811e22b48
[2/2] arm64: rust: Enable Rust support for AArch64
      https://git.kernel.org/arm64/c/724a75ac9542

-- 
Catalin


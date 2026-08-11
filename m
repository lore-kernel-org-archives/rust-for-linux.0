Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B426A22538F
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 04:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786421840; cv=none; b=mQq0Jhm3G6hVbu20MY211PbSjSDgo6luUrf/BuXjb0hCgnEHXwNelXLMLf0C6Ow5w9k56pyITWKJOrB0moK0XKrXF2uYJFwKAaZdN18fhTvJ10xWlwAamxqMf9+UuiE54I2yFHaxHV23KuJZzSjOtIqpf++7HFusqsGui36QN68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786421840; c=relaxed/simple;
	bh=UEyXO9WfyWKHaBwDAx+RidIqEgxPHpBHN+mhEPplu/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o4gmJfmLv9Ig+a12CHBXsbL+6tfZ5OSo3s6auJFjDydLWTE+xyP6GRzJNpTAT3HwNqVDQ3lfTNuzRjzRWibMwnktkciwj6tXjUBtfB3NZZdxcNP9EyRMe3TuNQICQ25kA1+t6r2yhEYtSduBSSpQ3NZ/l0NsbutWv30PLvnZCDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jL2mO2Gr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jL2mO2Gr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C251F000E9;
	Tue, 11 Aug 2026 04:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786421839;
	bh=lQO2IZ2Zm+w+DghjA8P/bYUMB7Da8sJv4fPPp4Rn+V4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jL2mO2GrTttviBEvPh071ujdULJ4bUsVrrfnQ7qlsmlu+RpAJPfPgrDzmYDAm4u0w
	 qjSDonwkB69sCox3LhYfUJKkMR8xn1cg3QXHpZxkBR5RGpFrNN3Hsqk6pQdjRy+BDt
	 7rPxHfMYycsFFOSGyfC+Otatfl39WVDHOfJVNTHwxYOjx36INaLMhWc8X4WmwWy0Yg
	 /ukdqkEbh5kefTE2AhzQ/3O83k4taKsiDAu2fKNwcnNDRtYXoUXm4XRLp+TfHKUqYg
	 qmPA2AUbJ/JtwR2AVl0L//jU9KMi2lrK5m1klARUPjFqwyfv5EAX/sSrN5mlYY72sG
	 qHhzD+ovRAw8g==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 35EB1F40066;
	Tue, 11 Aug 2026 00:17:18 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 11 Aug 2026 00:17:18 -0400
X-ME-Sender: <xms:TqJ6avXnEAObD37moNKfqBBH0nGNfPXDV2Ct4cfI1-lPwQ22WtL0-A>
    <xme:TqJ6anAF3OWv_pXBsbDi2vHyph6pVNJgF3qY5mkIUq4CvkSJOmU6b_hrlxjqwCv2H
    PKjCGloLT-8mSzklvBBpUGg7mR1C5-qwxkcahoCLPXMqGJ-ip8J>
X-ME-Received: <xmr:TqJ6asf1-0Jv-BAjs3FoFe65FMmXKC0rqHbFNs5qmP13CkTI8MgcxGGGCEGxespbPat7kvdrUbWyf6EnZFzSDatBCChme4B3>
X-ME-Proxy-Cause: dmFkZTGhPmSJ2utFx5D+CERYZNZI0lWwnPoWtdGm1Q24HJV4wHGzzwHlMIG+Ha5+CXwcMV
    A4Y9FRkPx4iKSOEUD0o2bsQuhlyU9EriC9Wg14EdheA+ghP28LE9/AWvwFlpxSSeaugzOB
    7cy4mIL1Zm7HiOC+SZefKLt12lBqjCbJwen8IDKEhCYWwgAOLbn6601jx3eoTsUn+elAvW
    +Nb62Q3PknpJ5JS/PGcU8W3OZCAnD6uTdZFXZQ5gjZYvJftgWnEBjoe2o4DqsJ8oOzcaMy
    Yz2rdDjTzptNIY6+Mw8UVdo8kkEkZUhr3Jhp99XO6QkjjOLjPFF2Am+c3dLYLr4j2hpoMx
    7PMXMiREQJSh+CN1UeANwAy81hWqf7DRpg0lryc+NxErKa1fKy03/kQwvM5xYCVtfQY3ff
    iEomhnqrSeXjYBFY9CHxZUOjo3QmX0RzF/GdI7ykhwkgnptTjGpO5hlH0VwKp288DlFFlP
    KgYzY32p7qDQnrPXwfRk+I1Y4SVjJNc0p/uxcL9sJHfRkZIRXGl9r9fnaK+UwLyhQ7IzJX
    7GdNh12GQQcKHSIJp/pBwnemSmAhatNgqWJU34c5NmYnXQD4Myvvm1x5V/yoPnHTyja5Rl
    aiiqnoxzAJckRkP2ST4aN6vYZetzE0A2/s+ZGKraTjJhklBpibitmtNza6BA
X-ME-Proxy: <xmx:TqJ6auriNj1u23VdSLCdjwxSO4bPZp3FqS79LLEp2Ic77gYDv1f7sg>
    <xmx:TqJ6atRJ2Nwf-3gKGxexpCKeqoTt0lbnKeyMxC2vb9kvRf2AMjO_Aw>
    <xmx:TqJ6auW2bZjQ08Og4OT5CbmiRGPSt4UjksXtfMGh3HFZWmvXV0Xt6g>
    <xmx:TqJ6aieoz8Q1B2Cj6ysOnlofRQi81UOO_okaS3cMK_7PS292gyoFwQ>
    <xmx:TqJ6ahwCJeeg60-hSm0VIv0DfdGEDqoOcw_BoNBWml5jAW5my0QAYEbQ>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Aug 2026 00:17:17 -0400 (EDT)
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Ingo Molnar" <mingo@kernel.org>,
	"Will Deacon" <will@kernel.org>,
	"Boqun Feng" <boqun@kernel.org>,
	"Waiman Long" <longman@redhat.com>,
	"Gary Guo" <gary@garyguo.net>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Lyude Paul" <lyude@redhat.com>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [PATCH 0/4] Improvements on SpinLockIrq patch series
Date: Mon, 10 Aug 2026 21:17:10 -0700
Message-ID: <20260811041714.27679-1-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260810085255.GE1642880@noisy.programming.kicks-ass.net>
References: <20260810085255.GE1642880@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Peter,

Per your request, I send those improvements as separate patches. I did a
very light build and unit tests. I'm still waiting for the 0day build
test report in case we missed something subtle, but figured maybe it's
better if I send them out while I'm waiting.

Regards,
Boqun

Boqun Feng (4):
  irq: Add {over,under}flow detection for
    local_interrupt_{enable,disable}
  selftests/bpf: Use the new NMI_BITS definition
  irq: Explain better on NMI_MASK overflow condition
  irq: Add max local_interrupt_disable() nesting level kunit test case

 include/linux/hardirq.h                       |  2 +-
 include/linux/interrupt_rc.h                  | 13 +++++++++++
 kernel/irq/refcount_interrupt_test.c          | 22 +++++++++++++++++++
 .../testing/selftests/bpf/bpf_experimental.h  |  2 +-
 4 files changed, 37 insertions(+), 2 deletions(-)

-- 
2.50.1 (Apple Git-155)


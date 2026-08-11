Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801F32F83A2;
	Tue, 11 Aug 2026 04:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786421843; cv=none; b=nM8ThzWrzikVTVGnN3i3jIx1g5/wTi2903NBtLvUAyL1y0996uTXjWWcq5pCqTdIeo4lx0UtPgaPjIM5FUyN0EFPNSBWzWud8uQCeroLJJGj93cy1Dwnq4sB+ixrLNtK+o8P0sLhi6rDGmnwqyoOJN46jSgUKWPH/phafS/Za5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786421843; c=relaxed/simple;
	bh=JjkVG73r7lYjnLEXq7s+2q/JUAUb/6Wz1yXB0mqjSQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qtxB5N4IFXgO24W2QKxntdFeQWcDWJRRFi8Dj+MXXMj6VGvfnuzsSzNm3d6ICiSdWP3PzEaF10iJOpLTfmk23UCzYQ0TgowJAOUHDlvWkGnpUfkC6nF8cjYca9qLT6lPhwbgMYXy6gWEhOxnrcXFbhKYCvfXHQgCvxTxO5RqPag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fo6YcTsI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fo6YcTsI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C1E1F000E9;
	Tue, 11 Aug 2026 04:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786421842;
	bh=8x3fFavkcu14gzpA90mnvkW+fghdlQvEb55IQ7ba3bg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Fo6YcTsIV/Y0oPe+7mLfSacpBc336UGqX5WMgtz9m+uDqKu0yqSTyfUs3AQK6xNq1
	 3jmKKtzGYNuhTjHJvJ8XlO9YR7cMCEwN5Bg0ljSciC9hkHJSnl7Xp1scN3eiZKKzCJ
	 oV7eonSq9qJYa4sPjz2LDkT1HFqAYtBPnYEFKyJBntqerIfee47B2NplDtHBF8UvHy
	 v3xl1i4k3ygD4W0r5aP6u3XA+gJJlPx9rA/OYYtSxn+CLuzzc4r0dAJhJxmJfHvEkc
	 3VWXbEoVx5sQJhq0DuejoZLdVoWmbXIhG/aaIFcVO1YV8O4sP5EPyJNWEvJ+GRnohs
	 CMSNv8kAWy0/Q==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 23486F40066;
	Tue, 11 Aug 2026 00:17:21 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 11 Aug 2026 00:17:21 -0400
X-ME-Sender: <xms:UaJ6atVBvbn8-xn-AvRbDrhJv6TYRj3NT0zTN0DLL1LWLsCbh23aLA>
    <xme:UaJ6atCJfaC-2F2wkZHmarXVQvGj3DohbICZSIeM6RH4JRWK8u5TLEBXarfyfdNoB
    TkhqRA0KACH45KiSRnjyMNy3LoYQiNgS9sO381x_apVfElr0as2>
X-ME-Received: <xmr:UaJ6aqeSLx_KZraihDrLyKT4uFOMGncUs3rooRSBXqIN7cU_Ef7xUEYX3k6UCzd49Qj7X16-TQ5ZGpqz3uKou95TG29ij6M6>
X-ME-Proxy-Cause: dmFkZTGhPmSJ2utFx5D+CERYZNZI0lWwnPoWtdGm1Q24HJV4wHGzzwHlMIG+Ha5+CXwcMV
    A4Y9FRkPx4iKSOEUD0o2bsQuhlyU9EriC9Wg14EdheA+ghP28LE9/AWvwFlpxSSeaugzOB
    7cy4mIL1Zm7HiOC+SZefKLt12lBqjCbJwen8IDKEhCYWwgAOLbn6601jx3eoTsUn+elAvW
    +Nb62Q3PknpJ5JS/PGcU8W3OZCAnD6uTdZFXZQ5gjZYvJftgWnEBjoe2o4DqsJ8oOzcaMy
    Yz2rdDjTzptNIY6+Mw8UVdo8kkEkZUhr3Jhp99XO6QkjjOLjPFF2Am+c3dLYLr4j2hpoGE
    Sy0122RGwIwse33IuPS2/KEdexpCmZCfHK1eoT4VKeumc/wJCl4V+BN9zMO2UGdrCmB+40
    j114LQqZUdieb3h89xF/OWoxQHNGP6MAf07hh5lhlba4KB7VKh861XeHw+W/QJz9LAcQp1
    x6NK5BQMIHgJ3VFnDm9zydsNm15JcICiYF8jLLwjw+rNu/xs0gLHUh6Gr8GxLjWpSKDw98
    VRVD4zbMoq3AjVUaH1Yk0NWBy31esrqaxgF9ld3jxSVDSfmP2UVFQl9rQIFIzN8VpSYoyT
    r3yJaOIjTqIAYqhtMt4QEzpJI+MD0UyeelVxpKvK+hwXR8kfWDClU8GZxKpQ
X-ME-Proxy: <xmx:UaJ6akruoTw91WLpEUmqLZ8-fDyFntoFiv9lNdWXdyQvTJXp6GCiSQ>
    <xmx:UaJ6arRhJIYnkugs0ius-H-sTQfcf3ZsubIJKLosHMGA78qi5Qxhnw>
    <xmx:UaJ6akUhx00ino5JMIr9ZJJCsX1edrbGGIQjXl8kb7qyhG171O2OIg>
    <xmx:UaJ6agcz9KGB35Vo633WYnhxHgGG4pZXhrC7PYVjpsNSB1hObfnUjg>
    <xmx:UaJ6anxj-SqxC6oK_3mElfa5m5iILxDf5CkB4xcwGPMzdroAbDUEShsZ>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Aug 2026 00:17:20 -0400 (EDT)
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
Subject: [PATCH 2/4] selftests/bpf: Use the new NMI_BITS definition
Date: Mon, 10 Aug 2026 21:17:12 -0700
Message-ID: <20260811041714.27679-3-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260811041714.27679-1-boqun@kernel.org>
References: <20260810085255.GE1642880@noisy.programming.kicks-ass.net>
 <20260811041714.27679-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The definition of NMI_BITS was out of sync after the introduction of
HAS_SEPARATE_PREEMPT_RESCHED_BITS, hence adjust it.

Reported-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 tools/testing/selftests/bpf/bpf_experimental.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
index 0159a3d365c8..56520d551abd 100644
--- a/tools/testing/selftests/bpf/bpf_experimental.h
+++ b/tools/testing/selftests/bpf/bpf_experimental.h
@@ -368,7 +368,7 @@ extern int bpf_cgroup_read_xattr(struct cgroup *cgroup, const char *name__str,
 #define SOFTIRQ_BITS	8
 #define HARDIRQ_DISABLE_BITS	8
 #define HARDIRQ_BITS	4
-#define NMI_BITS	1
+#define NMI_BITS	(1 + 3*IS_ENABLED(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS))
 
 #define PREEMPT_SHIFT	0
 #define SOFTIRQ_SHIFT	(PREEMPT_SHIFT + PREEMPT_BITS)
-- 
2.50.1 (Apple Git-155)


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925011;
	b=Gh9SiX6uFbIn43P6K98gTgUSG7aWUE6ekHtZwxetxJK5tFVAy/s4ceGg6HXPXvS0x7xS
	 NxTiAOm1lOvWFMvB2q3q0xSmgKl5UuplfXE8FrVqBv0tcl3fvWLOneMz6LlaeuQS5vCaq
	 4XzQFo+vO0dY/xumVZzpxEXAIZW/lXAbjUigp8BDWvizqZ+FHG6DDBula+ngvsePhKzPg
	 kzuE19R8LFf3oSft+7uCEpdB0U8hln6TW0G0NBeFOFkjSUlkBpUNP9YpFMVHcPZFbxDu4
	 f1bzjcavuPiZQ47LF1ywfElYlJ7GBWzh5M/VuKQXXavtg9F36/qCjr1Tk98Gm4jUdlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=nMzWFwI+mak9azVtEmWBpgG0qWEbzbvHkoZAECXYtcM=;
	b=GfdE3qrTvKDe8yJzJ1f+Abc0nHgxQplb0+IwinlChsUd/ubXwtI581yP81qIBhNTETNi
	 dn7JGiV2UKKb8U5H+STwOT5e61HtGxktoTA/M2m2XZnGm6NN9gyW6ZDVLu7K8lgBXwi+Y
	 Q5AakmYOTQW+LXjvurx2Z0aSlyujdnvJtGa0ojGYOuXZUvhyxiqqGQGNRqOTm16vv8nnU
	 2oBEDYTaRjaSNCeChr5eRg2aOeJZmA8SjJsyXLL1ldyFLUIu0K3Ds2g4Tpl23yL6JcUwm
	 ZYJjqmqKrcLjSHhwxQDfSuZyNKkVxFXBmrwoCG5Lhc4D4Fw35ifx5t3C1nKug5ZisXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hLqTISRn;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFED606A32A
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 14:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EFED606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hLqTISRn
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1fdde384cso25847975e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 06:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794925009; x=1795529809; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMzWFwI+mak9azVtEmWBpgG0qWEbzbvHkoZAECXYtcM=;
        b=hLqTISRniY9yydJfP3sMzv9cKRy+pP1oJ86DI8bpQlkHnwqz71bHUa5wiz5rRHMeRH
         My4jDcmSvEGM1Kr/gRkutW6QgNpsIOK8TKajxEZHRfhxqDbglNHVBUMp7a8okF7jbWWY
         X+XqMq9NLFXM3aM4dUX9JllbHANeNKtN800teJk4u09Lyeq/YUmC1t3i/dNFPd+xOlBe
         XZ5X+fNfOczVLoq5QiNLR+/s5V1X+vVwyr6YOiARNhInnAEb0j8GX2AH1uTPtrS7IC/+
         Lw9Qvxd5steHBHpnKWQ/k6NQtCQmlqxYpEr3SZ70b+A/NCzKnIY8tNwHeE+mfEKGlW5k
         AZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925009; x=1795529809;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nMzWFwI+mak9azVtEmWBpgG0qWEbzbvHkoZAECXYtcM=;
        b=puN2j2qg+yaCX+VDNju14LJdMKyojoJwegd2MRbd2VDj33zUpu8He/4tcz+bz316Un
         6IG1k/XsotSVMaZmLqHx2sPM7YRbKGRcixZfbsLlb4sUBjj9egQVtSNBJIzZHqdCrVUV
         jbk2bcjpwSqngA2/rq9qThrWheKXsI98qL1xJ3OoGq+x24qML42tw5PEsyCGjp6uXB71
         WEuIWzArultiJXxvlCEvWVXPhbGAltToPnsbK2aPjOmD/RSmECrRPj9UIgjFfOa2iH2l
         wQxVVU1Y7KmuPkuz+wf1IjsXAr73pe5I3RFYCyYKqkv6pejverllWofCfPbUyUwv6mol
         UXuA==
X-Forwarded-Encrypted: i=1; AL+hErF+7KHkBQSzPf0g9bOfbw9tYd1tovKugiDMRJrjsmbONxikcZ8ebB2oywMhVT3dlgiixU3nNveTdhi67BmB+g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8OJoVgsrawNNBP5UzDogeQ1K1q6vnbCGoahLueK6n0zyuTbFo9
	kWJtR84qFRxjsY+pePIps4uRXl5uupHDNbFRChfA5QYYoNjuO4P+SqIvb18v1lKvFA2F01tWTAE
	ALiupo8/9HXnfS/RE1w==
X-Received: from wmbjw8.prod.google.com ([2002:a05:600c:5748:b0:4bb:5e69:8177])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3d91:b0:4bb:6871:8f21 with SMTP id 5b1f17b1804b1-4bb68718fa0mr190371815e9.23.1794925008479;
 Tue, 17 Nov 2026 06:16:48 -0800 (PST)
Date: Tue, 17 Nov 2026 14:16:46 +0000
In-Reply-To: <20261117001507.1611984-2-dakr@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117001507.1611984-1-dakr@kernel.org> <20261117001507.1611984-2-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117141646.2991752-1-aliceryhl@google.com>
Subject: Re: [PATCH v3 1/5] rust: task: add safe schedule_timeout() wrapper
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, boqun@kernel.org, gary@garyguo.net, 
	lyude@redhat.com, daniel.almeida@collabora.com, work@onurozkan.dev, 
	ojeda@kernel.org, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, tamird@kernel.org, 
	acourbot@nvidia.com, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	jack@suse.cz, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026 at 01:14:42AM +0100, Danilo Krummrich wrote:
> Add a safe wrapper around schedule_timeout() that takes and returns
> Delta<Jiffy>, treating negative durations as zero.
> 
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

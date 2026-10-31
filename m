Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793419258;
	b=fg1Gnup5Kvyr3EPZRwefSsmIgjVM5RvkVcCdNStvwylF9HZAb1RGcCx7Ao36OuwzpKne
	 tHWFIdpnYLzJCXlCB5+/Cztn6TaFZSCYI0x+t4IoYuNg1rvykHkKqS+/eMypZaEx5gaEl
	 GSwdeaj/Kzv2C1egFTcgENfR96O05fat3wDqybp73HG2qoKbVouq8G/s73zx5J7yrXc/m
	 2tni0ZNu62jme+4wZrZBjRv3lCPHHZW5ko9K2SDIND8h2Lbf/i3sJN7MkmhP0bzUdkRPj
	 Me1MZgA6rImfSIZwqaVZeXZQVlXNRYmyooys/ozkuBpw0ipH/WdO2RiuAe6ghZ29Q0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793419258;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=hIBP/ZFlGIgEFeh4xbB0XDIT2nWk6Vi/76xeJ+SkBJE=;
	b=3M2SmCru+VmGDK0y8XhtZ1p3B9flHe8LEdNH6Me4qvNsX+wfpx/AqR9yyPvvsz6d90de
	 EUBD+eakdb5qNBCfPGpQnuMJe+lbWlu2JKxRrYVS1eHE07242e2BDUfC1/ePySiZknYzB
	 6eeY+IEFxOMBMI+z/AUDbOLoBnWvG63sdUCgMD3/gShkGqMnqSO6Bqcuwhot3lj+AqKzt
	 c5eESBXFm1MqNAMaGlVCdKNwftQXAo3CglRACNsG1szDdHxSDI/CNdgfu8bctfnkVyUKM
	 R3TO5tFQI0/gKLbpn9kHoo9+ecyTvWXNb/ANwZwgf9qusQU9jqFhixPPeCFP4oSeyUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A2Abj0+y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA61B606A31A
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 04:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A2Abj0+y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134561F00919;
	Sat, 31 Oct 2026 04:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793419257;
	bh=hIBP/ZFlGIgEFeh4xbB0XDIT2nWk6Vi/76xeJ+SkBJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A2Abj0+y4j9OEsS9dS+O+5E9xFEca2Cd0UytZHKC4AHdSTdaesc9v93yiipfv+JTf
	 zkXHRiU3QBMXbPAuUCT8EF2lIHaWDuy9c22N+SSFavUkXghp7idH37/3+yFWBmnO01
	 5pc57zubkkFLdRwSs5l/cep1yC/jz8A92Sna4PG6VSk2NuLzdUS70L+aKoWh+P5gt0
	 7LoOlGWtiYf6tcOhz1aGFbQARBnUe5x/2qufgeZG9SI93ayjAo53NZ5hwuIWWBZSQw
	 aJJZUS+7h9i6Wav8YLieRKzV6crOrjeLndhWuGk8hRB53QTmo7cDAXnX2t8Z4yS4V+
	 mAHV2aTwTxWMA==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6B3FEF40067;
	Sat, 31 Oct 2026 00:00:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 31 Oct 2026 00:00:56 -0400
X-ME-Sender: <xms:-Gflauv0VoZ43CzV7K0IkdEDVu3Vv8BWCY5kJPz79JKEHxPWLgshTQ>
    <xme:-Gflaplu5ICSpcuVLOYkB-RkFgGMyID7ip2FsX1KhdaxLG_Btoh8wlHHzs6wRAcAh
    0rRRa9MvSsOvwYTucLRXNvf8ngmTDLKseglCm-jXVUzEQ6badwoKUY>
X-ME-Received: <xmr:-GflavU0aGpYJNFHIPgIRBSsAkMCiPU-9PtnhH7XnSg2xma9uF4OU0nDNGO2FOHa0p9_QGZnKHTkXP31so7mGIbHqIrhFql1>
X-ME-Proxy-Cause: dmFkZTE4Wsu7thGms1Wzafq0VjCqESWOrmQWuG5ya4LgUPUh7bMkd+98KOH9TwL2OQ3eVe
    o1oaY4oFlBoJnOrgXgYPNhfZeGo6HixvkXKnoLqinqysbM0o4VjFf30nWsEGR5YKrRCdHq
    1O+lgA0JFRpTIJosia98eb27ZOl3Ur3EQ+6q9VDzVuyWCKTzFNOyVPV+VuwmmUoqaoDyY7
    9lo+b08hIPl6tY657qeSFAKRs2m4Se8yOpT2gjETwW9Xiw+d415TgMdWM/rE7kWO4ZJCYD
    vH8L9uTNhZ9OoOOvdnBcYJ3Rj2X5H1IlIY92cMB4msJ96cWHVkHO4FDRqJkrbdvUq3xBDX
    /tcWMAr50hJW3oxJn7v8Dfqt/uMQkJvu/T6ck56gb5GXZf2awdjKM8K7rK/1EY4y7TMEyY
    FrGrMTmtFOPeLnWJMuuJ+Y0E7DTnFN7oYubPRfvTucL/1bZnrVaffJLFDcgTBvCsNzR+o2
    rsq1/TlXgTJ/PWMOMso+1k2ejjVT8vHq2reH7CLNyQXsdjIKN6CimvAitRRz6avUCUTdss
    cDdZZG73Nda5ozgxjibFeHLpPc1099TWk+IwYiDUXSzRSLkUzBjxQHKZhEA93jCa5L/1Eh
    YxstSvtzODsaHG65MbnfcGbGNtL6+0wtK4A3u35X0b/SkyouGJJG67IA22Cw
X-ME-Proxy: <xmx:-GflaslH9HvnpnWIHqdwVEIdrGhOhvRItuzZ4EQGU8nzg5O15JfPSw>
    <xmx:-GflasTtOdZRTCDgP4mTViUMWOfpdDx6ILdklUN8SS-xkh6Brl5xxw>
    <xmx:-GflagGYtj-bBHrR8ptqM-GDNCGHE4YQlbFDRM_Q1YnxzTUi-Zed0Q>
    <xmx:-Gflamj1c0KEUDDUigEbTQdrZEhh_5z-mwskidCCW3LULYX633BP4g>
    <xmx:-Gflauplct1O62boPGlo8Gf8kqG1UoO1JDL8Fqh2eZi6vwfH3bE__dZX>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Oct 2026 00:00:55 -0400 (EDT)
Date: Fri, 30 Oct 2026 21:00:54 -0700
From: Boqun Feng <boqun@kernel.org>
To: Jenhao Chen <jenhaochen@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Qais Yousef <qyousef@google.com>, Ben Wei <benwei@google.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust_binder: use Atomic::add() in BinderStats
Message-ID: <auVn9hKzTZSGP3RD@tardis.local>
References: <20261031030801.4100693-1-jenhaochen@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261031030801.4100693-1-jenhaochen@google.com>

On Sat, Oct 31, 2026 at 03:08:01AM +0000, Jenhao Chen wrote:
> BinderStats::inc_bc() and BinderStats::inc_br() increment command and
> return statistics counters on every Binder transaction and reply using
> Atomic::fetch_add(1, Relaxed), discarding the returned previous value.
> 
> Because the return value of fetch_add() is unused in Rust but must still
> be produced by the underlying value-returning atomic RMW helper
> (atomic_fetch_add_relaxed()), the compiler is forced to emit a
> value-returning atomic operation (LDADD on arm64 with LSE, or LOCK XADD
> on x86) instead of a non-value-returning atomic add (STADD on arm64, or
> LOCK ADD on x86). On arm64 CPUs with LSE, value-returning LDADD requires
> a round-trip response from the L2/interconnect to populate the
> destination register, whereas non-value-returning STADD (encoded as
> LDADD with WZR as the destination register) may be executed as a far
> atomic without waiting for the old value to return to the core.
> 
> Switch BinderStats::inc_bc() and BinderStats::inc_br() from
> fetch_add(1, Relaxed) to add(1, Relaxed) so they lower to atomic_add()
> and emit non-value-returning atomic increments. This also matches the C
> Binder driver, which uses atomic_inc() for these statistics counters in
> binder_thread_write() and binder_stat_br().
> 

Make sense, thank you!

> No functional change intended.
> 

However I would remove the "No functional change intended", because a
code gen change is still somewhat a functional change to me. Anyway,
with or without it:

Reviewed-by: Boqun Feng <boqun@kernel.org>

Regards,
Boqun

> Signed-off-by: Jenhao Chen <jenhaochen@google.com>
> ---
>  drivers/android/binder/stats.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/android/binder/stats.rs b/drivers/android/binder/stats.rs
> index ec81dc7747db..68cb0cf48865 100644
> --- a/drivers/android/binder/stats.rs
> +++ b/drivers/android/binder/stats.rs
> @@ -32,14 +32,14 @@ impl BinderStats {
>      pub(crate) fn inc_bc(&self, bc: u32) {
>          let idx = _IOC_NR(bc) as usize;
>          if let Some(bc_ref) = self.bc.get(idx) {
> -            bc_ref.fetch_add(1, Relaxed);
> +            bc_ref.add(1, Relaxed);
>          }
>      }
>  
>      pub(crate) fn inc_br(&self, br: u32) {
>          let idx = _IOC_NR(br) as usize;
>          if let Some(br_ref) = self.br.get(idx) {
> -            br_ref.fetch_add(1, Relaxed);
> +            br_ref.add(1, Relaxed);
>          }
>      }
>  
> -- 
> 2.56.0.317.g454f8302e1-goog
> 
